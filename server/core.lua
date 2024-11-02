Core = nil
CoreName = nil
CoreReady = false
Inventory = nil
Citizen.CreateThread(function()
    for k, v in pairs(Cores) do
        if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then
            CoreName = v.ResourceName
            Core = v.GetFramework()
            CoreReady = true
        end
    end
    -- Inventory
    local inventories = {
        {Name = "qb-inventory"},
        {Name = "ox_inventory"},
        {Name = "qs-inventory"},
        {Name = "ps-inventory"},
        {Name = "lj-inventory"},
    }
    for k, v in pairs(inventories) do
        if GetResourceState(v.Name) == "starting" or GetResourceState(v.Name) == "started" then
            Inventory = v.Name
        end
    end
end)

function GetPlayer(source)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        return player
    end
end

function Notify(source, text, length, type)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        Core.Functions.Notify(source, text, type, length)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        player.showNotification(text)
    end
end

function RegisterUseableItem(name)
    while CoreReady == false do Citizen.Wait(0) end
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        Core.Functions.CreateUseableItem(name, function(source, item)
            TriggerClientEvent('exter-books:showNotebook:client', source, item.info or item.metadata, item.slot)
            return
        end)
    elseif CoreName == "es_extended" then
        local hasQs = GetResourceState('qs-inventory') == 'started'
        if hasQs then
            Core.RegisterUsableItem(name, function(source, item)
                TriggerClientEvent('exter-books:showNotebook:client', source, item.info, item.slot)
                return
            end)
            return
        end
        Core.RegisterUsableItem(k, function(source, _, item)
            TriggerClientEvent('exter-books:showNotebook:client', source, item.metadata, item.slot)
            return
        end)
    end
end

Config.ServerCallbacks = {}
function CreateCallback(name, cb)
    Config.ServerCallbacks[name] = cb
end

function TriggerCallback(name, source, cb, ...)
    if not Config.ServerCallbacks[name] then return end
    Config.ServerCallbacks[name](source, cb, ...)
end

RegisterNetEvent('exter-books:server:triggerCallback', function(name, ...)
    local src = source
    TriggerCallback(name, src, function(...)
        TriggerClientEvent('exter-books:client:triggerCallback', src, name, ...)
    end, ...)
end)