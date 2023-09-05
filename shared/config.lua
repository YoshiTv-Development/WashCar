Config = {}

Config.Blip = {
    Sprite = 100,
    Scale = 0.8,
    Colour = 0,
    Name = 'Lavaggio Veicoli'
}

Config.WashCar = {
    Gridsystem = {
        Type = 0,
        Show3D = false,
        Color = { r = 255, g = 133, b = 60},
        Distance = 38.0,
        Control = 'E',
    },
    Progress = {
        Time = 5000,
        Position = bottom -- bottom o middle
    },
    Item = 'money',
    LivelloPulizia = 0.0
}

Config.Prezzo = 100

PosWashCar = {
    vector3(21.9623, -1391.9545, 29.3286)
}

Config.Lang = {
    Gridsystem = 'Premi [E] Per Lavare Il Veicolo',
    Progress = 'Lavando Veicolo',
    MoneyError = 'Non hai abbastanza soldi',
    CarError = 'Non sei in un veicolo'
}

