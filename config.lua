Config = {}

-- debug
Config.Debug = false

-- settings
Config.JobRequired = 'saloontender'
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.DukeBoxDefaultVolume = 0.5 -- music default volume 0.01 - 1
Config.DukeBoxRadius = 40 -- music radius

-----------------------------------------------------------------------------------

-- job blip
Config.Blip = {
    blipName = 'Saloon', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- job prompt locations
Config.SaloonTenderLocations = {
    {name = 'Saloon Tender', location = 'valsaloontender',      coords = vector3(-313.5073, 805.80718, 118.98068), showblip = true, showmarker = true}, --valentine
    {name = 'Saloon Tender', location = 'blasaloontender',      coords = vector3(-817.5921, -1319.085, 43.678947), showblip = true, showmarker = true}, --blackwater
    {name = 'Saloon Tender', location = 'rhosaloontender',      coords = vector3(1340.1748, -1374.819, 80.480606), showblip = true, showmarker = true}, --rhodes
    {name = 'Saloon Tender', location = 'stdenissaloontender1', coords = vector3(2792.3723, -1168.412, 47.932285), showblip = true, showmarker = true}, --saint denis
    {name = 'Saloon Tender', location = 'stdenissaloontender2', coords = vector3(2639.8435, -1224.268, 53.380401), showblip = true, showmarker = true}, --saint denis
    {name = 'Saloon Tender', location = 'vansaloontender',      coords = vector3(2947.8439, 528.06262, 45.338794), showblip = true, showmarker = true}, --van horn
    {name = 'Saloon Tender', location = 'armsaloontender',      coords = vector3(-3699.808, -2594.406, -13.31987), showblip = true, showmarker = true}, --armadillo
    {name = 'Saloon Tender', location = 'tumsaloontender',      coords = vector3(-5518.478, -2906.511, -1.751306), showblip = true, showmarker = true}, --tumbleweed
    {name = 'Saloon Tender', location = 'moonsaloontender1',    coords = vector3(1778.7017, -802.4389, 188.95924), showblip = false, showmarker = true}, --lemoyne speakeasy
    {name = 'Saloon Tender', location = 'moonsaloontender2',    coords = vector3(-2785.652, -3060.887, -12.34042), showblip = false, showmarker = true}, --new austin speakeasy
    {name = 'Saloon Tender', location = 'moonsaloontender3',    coords = vector3(-1086.129, 694.07788, 80.594093), showblip = false, showmarker = true}, --cattail pond speakeasy
    {name = 'Saloon Tender', location = 'moonsaloontender4',    coords = vector3(1614.2941, 837.96038, 121.30193), showblip = false, showmarker = true}, --hanover speakeasy
    {name = 'Saloon Tender', location = 'moonsaloontender5',    coords = vector3(-1850.383, -1739, 85.615165),     showblip = false, showmarker = true}, --manzanita post speakeasy
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
