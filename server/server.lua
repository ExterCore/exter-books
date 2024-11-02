RegisterUseableItem(Config.ItemName)

RegisterNetEvent('exter-books:updateMetadata:server', function(metadata, slot, title, desc)
    local src = source
    local Player = GetPlayer(src)
    if Inventory == "qb-inventory" or Inventory == "qs-inventory"  or Inventory == "ps-inventory" or Inventory == "lj-inventory" then
        local notebookSlot = Player.PlayerData.items[slot]
        if notebookSlot then
            notebookSlot.info.content = metadata
            notebookSlot.info.main = {title = title, description = desc}
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    elseif Inventory == "ox_inventory" then
        local notebookSlot = ox_inventory:Search(src, slot, Config.ItemName)
        if notebookSlot then
            notebookSlot.metadata.content = metadata 
            notebookSlot.metadata.main = {title = title, description = desc}
        end
    end
end)