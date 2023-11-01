Config = {}

-- Inventory Images
Config.img = "rsg-inventory/html/images/"


-- saloon blip settings
Config.SaloonBlip = {
    blipName = 'Saloon Crafting', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- blacksmith shop blip settings
Config.ShopBlip = {
    blipName = 'Saloon Shop', -- Config.Blip.blipName
    blipSprite = 'blip_shop_store', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.Debug = false
Config.Keybind = 'J'

-- saloon crafting locations
Config.SaloonCraftingPoint = {

    {   -- valentine
        name = 'Saloon Crafting',
        location = 'valsaloontender',
        coords = vector3(-313.7462, 806.18127, 118.98072),
        job = 'valsaloontender',
        showblip = true
    },
    {   -- blackwater
        name = 'Saloon Crafting',
        location = 'blasaloontender',
        coords = vector3(-819.3729, -1319.572, 43.678916),
        job = 'blasaloontender',
        showblip = true
    },
    {   -- rhodes
        name = 'Saloon Crafting',
        location = 'rhosaloontender',
        coords = vector3(1338.6545, -1374.345, 80.480628),
        job = 'rhosaloontender',
        showblip = true
    },
    {   -- saint denis (1)
        name = 'Saloon Crafting',
        location = 'stdenissaloontender1',
        coords = vector3(2792.2316, -1167.343, 47.932292),
        job = 'stdenissaloontender1',
        showblip = true
    },
    {   -- saint denis (2)
        name = 'Saloon Crafting',
        location = 'stdenissaloontender2',
        coords = vector3(2640.2575, -1225.084, 53.380378),
        job = 'stdenissaloontender2',
        showblip = true
    },
    {   -- van horn
        name = 'Saloon Crafting',
        location = 'vansaloontender',
        coords = vector3(2948.6765, 529.04693, 45.332336),
        job = 'vansaloontender',
        showblip = true
    },
    {   -- armadillo
        name = 'Saloon Crafting',
        location = 'armsaloontender',
        coords = vector3(-3698.504, -2594.319, -13.31987),
        job = 'armsaloontender',
        showblip = true
    },
    {   -- tumbleweed
        name = 'Saloon Crafting',
        location = 'tumsaloontender',
        coords = vector3(-5519.204, -2905.65, -1.751305),
        job = 'tumsaloontender',
        showblip = true
    },

}

-- saloon shops
Config.SaloonShops = {

    {
        shopid = 'valsaloonshop',
        shopname = 'Valentine Saloon Shop',
        coords = vector3(-311.6449, 806.24963, 118.97999),
        jobaccess = 'valsaloontender',
        showblip = true
    },
    {
        shopid = 'blasaloonshop',
        shopname = 'Blackwater Saloon Shop',
        coords = vector3(-815.8156, -1319.478, 43.678951),
        jobaccess = 'blasaloontender',
        showblip = true
    },
    {
        shopid = 'rhosaloonshop',
        shopname = 'Rhodes Saloon Shop',
        coords = vector3(1341.9393, -1375.176, 80.480659),
        jobaccess = 'rhosaloontender',
        showblip = true
    },
    {
        shopid = 'stdenissaloonshop1',
        shopname = 'Saint Denis Saloon Shop',
        coords = vector3(2793.6767, -1169.249, 47.919883),
        jobaccess = 'stdenissaloontender1',
        showblip = true
    },
    {
        shopid = 'stdenissaloonshop2',
        shopname = 'Saint Denis Saloon Shop',
        coords = vector3(2637.9946, -1224.823, 53.380378),
        jobaccess = 'stdenissaloontender2',
        showblip = true
    },
    {
        shopid = 'vansaloonshop',
        shopname = 'Van Horn Saloon Shop',
        coords = vector3(2948.0925, 526.24456, 45.328735),
        jobaccess = 'vansaloontender',
        showblip = true
    },
    {
        shopid = 'armsaloonshop',
        shopname = 'Armadillo Saloon Shop',
        coords = vector3(-3701.776, -2594.205, -13.31987),
        jobaccess = 'armsaloontender',
        showblip = true
    },
    {
        shopid = 'tumsaloonshop',
        shopname = 'Tumbleweed Saloon Shop',
        coords = vector3(-5517.493, -2907.832, -1.751305),
        jobaccess = 'tumsaloontender',
        showblip = true
    },
}

-- saloon crafting
Config.SaloonCrafting = {

	-- drinks
    {
        title =  'Beer',
        category = 'Drinks',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "malt",   amount = 1 },
            [2] = { item = "hops",   amount = 1 },
			[3] = { item = "yeast",  amount = 1 },
			[4] = { item = "water",  amount = 1 },
			[5] = { item = "bottle", amount = 1 },
        },
        receive = "beer",
        giveamount = 1
    },

	-- food
    {
        title =  'Stew',
        category = 'Food',
        crafttime = 30000,
        icon = 'fa-solid fa-screwdriver-wrench',
        ingredients = { 
            [1] = { item = "raw_meat", amount = 1 },
            [2] = { item = "carrot",   amount = 1 },
			[3] = { item = "broccoli", amount = 1 },
			[4] = { item = "potato",   amount = 1 },
			[5] = { item = "water",    amount = 1 },
        },
        receive = "stew",
        giveamount = 1
    },

}