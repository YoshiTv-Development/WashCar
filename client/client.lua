for k, v in pairs(PosWashCar) do 
    rapina = AddBlipForCoord(v+vector3(0.0,0.0,0.0))
    SetBlipSprite(rapina, Config.Blip.Sprite)
    SetBlipScale(rapina, Config.Blip.Scale)
    SetBlipColour(rapina, Config.Blip.Colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.Name)
    EndTextCommandSetBlipName(rapina)
end

for k, v in pairs(PosWashCar) do
    TriggerEvent('gridsystem:registerMarker', {
        name = '_PosWashCar'..k,
        pos = v+vector3(0.0,0.0,0.0),
        scale = vector3(0.8, 0.8, 0.8),
        size = vector3(2.0, 2.0, 2.0),
        msg = Config.Lang.Gridsystem,
        type = Config.WashCar.Gridsystem.Type,
        show3D = Config.WashCar.Gridsystem.Show3D,
        color =  Config.WashCar.Gridsystem.Color,
        drawDistance = Config.WashCar.Gridsystem.Distance,
        control = Config.WashCar.Gridsystem.Control,
        action = function(vehicle)
            local ped = PlayerPedId()
            local veicolo = GetVehiclePedIsUsing(ped)
            local inveicolo = IsPedInAnyVehicle(PlayerPedId(), false)
            local soldi = exports.ox_inventory:Search('count', Config.WashCar.Item)
            if inveicolo then
                if soldi >= Config.Prezzo then
                    FreezeEntityPosition(veicolo, true)
                    if lib.progressCircle({
                        duration = Config.WashCar.Progress.Time,
                        label = Config.Lang.Progress,
                        position = Config.WashCar.Progress.Position,
                        useWhileDead = false,
                        canCancel = true,
                    }) then TriggerServerEvent('washcar') end
                    SetVehicleDirtLevel(veicolo, Config.WashCar.LivelloPulizia)
                    FreezeEntityPosition(veicolo, false)
                else
                    ESX.ShowNotification(Config.Lang.MoneyError)
                end
            else
                ESX.ShowNotification(Config.Lang.CarError)
            end
        end
    })
end