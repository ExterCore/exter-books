local currentItemSlot = 0
RegisterNetEvent('exter-books:showNotebook:client', function(metadata, slot)
    local mainData = {}
    local main = metadata.main
    if main and next(main) ~= nil then
        mainData = {title = main.title, description = main.description}
    else
        mainData = {title = "My Notebook", description = "Description"}
    end
    local notebookData = {}
    local content = json.decode(metadata.content)
    if content and next(content) ~= nil then
        for k, v in pairs(content) do
            notebookData[k] = {
                title = v.title,
                content = v.content
            }
        end
    else
        for i = 1, 15 do
            notebookData[i] = {
                title = "Dear Book!",
                content = "Write Something"
            }
        end
    end
    SendNUIMessage({action = "openNotebook", data = notebookData, mdata = mainData})
    SetNuiFocus(true, true)
    currentItemSlot = slot
end)

RegisterNUICallback('callback', function(data)
    if data.action == "nuiFocus" then
        SetNuiFocus(false, false)
        TriggerServerEvent('exter-books:updateMetadata:server', json.encode(data.metadata), currentItemSlot, data.nheader, data.ndesc)
    end
end)