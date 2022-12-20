Config = {}

-- debug
Config.Debug = false

-- settings
Config.JobRequired = 'saloontender'
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48

-----------------------------------------------------------------------------------

-- job blip
Config.Blip = {
    blipName = 'Saloon', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- job prompt locations
Config.SaloonTenderLocations = {
    {name = 'Saloon Tender', location = 'valsaloontender', coords = vector3(-313.5073, 805.80718, 118.98068), showblip = false, showmarker = true}, --valentine
}

-----------------------------------------------------------------------------------

-- wholesale blip
Config.WholesaleBlip = {
    blipName = 'Saloon Wholesale', -- Config.Blip.blipName
    blipSprite = 'blip_shop_store', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- wholesale prompt locations
Config.SaloonWholesaleLocations = {
    {name = 'Saloon Wholesale', location = 'saloonwholesale', coords = vector3(2800.9323, -1346.927, 46.714141), showblip = true, showmarker = true},
}

Config.SaloonWholesale = {
    [1] = {
        name = 'beer',
        price = 0,
        amount = 500,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'whiskey',
        price = 0,
        amount = 500,
        info = {},
        type = 'item',
        slot = 2,
    },
}

-----------------------------------------------------------------------------------
