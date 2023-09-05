RegisterServerEvent('washcar', function(item)
    exports.ox_inventory:RemoveItem(source, Config.WashCar.Item, Config.Prezzo, false, false)
end)
