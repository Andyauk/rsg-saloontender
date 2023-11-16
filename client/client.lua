local RSGCore = exports['rsg-core']:GetCoreObject()
local options = {}
local jobaccess

-------------------------------------------------------------------------------------------
-- prompts and blips if needed
-------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    for _, v in pairs(Config.SaloonCraftingPoint) do
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds[Config.Keybind], Lang:t('lang_0'), {
            type = 'client',
            event = 'rsg-saloontender:client:mainmenu',
            args = { v.job },
        })
        if v.showblip == true then
            local CraftMenuBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(CraftMenuBlip,  joaat(Config.SaloonBlip.blipSprite), true)
            SetBlipScale(Config.SaloonBlip.blipScale, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, CraftMenuBlip, Config.SaloonBlip.blipName)
        end
    end
end)

------------------------------------------------------------------------------------------------------
-- main menu
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-saloontender:client:mainmenu', function(job)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    jobaccess = job
    if playerjob == jobaccess then
        lib.registerContext({
            id = 'saloon_mainmenu',
            title = Lang:t('lang_1'),
            options = {
                {
                    title = Lang:t('lang_2'),
                    description = Lang:t('lang_3'),
                    icon = 'fa-solid fa-screwdriver-wrench',
                    event = 'rsg-saloontender:client:craftingmenu',
                    arrow = true
                },
                {
                    title = Lang:t('lang_4'),
                    description = Lang:t('lang_5'),
                    icon = 'fas fa-box',
                    event = 'rsg-saloontender:client:storage',
                    arrow = true
                },
                {
                    title = Lang:t('lang_6'),
                    description = Lang:t('lang_7'),
                    icon = 'fa-solid fa-user-tie',
                    event = 'rsg-bossmenu:client:mainmenu',
                    arrow = true
                },
            }
        })
        lib.showContext("saloon_mainmenu")
    else
        RSGCore.Functions.Notify(Lang:t('lang_8'), 'error')
    end
end)

------------------------------------------------------------------------------------------------------
-- crafting menu
------------------------------------------------------------------------------------------------------

-- create a table to store menu options by category
local CategoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.SaloonCrafting) do
    local IngredientsMetadata = {}
    local setheader = RSGCore.Shared.Items[tostring(v.receive)].label
    local itemimg = "nui://"..Config.Img..RSGCore.Shared.Items[tostring(v.receive)].image
    for i, ingredient in ipairs(v.ingredients) do
        table.insert(IngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
    end
    local option = {
        title = setheader,
        icon = itemimg,
        event = 'rsg-saloontender:client:checkingredients',
        metadata = IngredientsMetadata,
        args = {
            title = setheader,
            category = v.category,
            ingredients = v.ingredients,
            crafttime = v.crafttime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    -- check if a menu already exists for this category
    if not CategoryMenus[v.category] then
        CategoryMenus[v.category] = {
            id = 'crafting_menu_' .. v.category,
            title = v.category,
            menu = 'saloon_mainmenu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(CategoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, MenuData in pairs(CategoryMenus) do
    RegisterNetEvent('rsg-saloontender:client:' .. category)
    AddEventHandler('rsg-saloontender:client:' .. category, function()
        lib.registerContext(MenuData)
        lib.showContext(MenuData.id)
    end)
end

-- main event to open main menu
RegisterNetEvent('rsg-saloontender:client:craftingmenu')
AddEventHandler('rsg-saloontender:client:craftingmenu', function()
    -- show main menu with categories
    local Menu = {
        id = 'crafting_menu',
        title = Lang:t('lang_9'),
        menu = 'saloon_mainmenu',
        onBack = function() end,
        options = {}
    }

    for category, MenuData in pairs(CategoryMenus) do
        table.insert(Menu.options, {
            title = category,
            description = Lang:t('lang_10') .. category,
            icon = 'fa-solid fa-pen-ruler',
            event = 'rsg-saloontender:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(Menu)
    lib.showContext(Menu.id)
end)

------------------------------------------------------------------------------------------------------
-- do crafting stuff
------------------------------------------------------------------------------------------------------

-- check player has the ingredients to craft
RegisterNetEvent('rsg-saloontender:client:checkingredients', function(data)
    RSGCore.Functions.TriggerCallback('rsg-saloontender:server:checkingredients', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-saloontender:client:craftitem', data.title, data.category, data.ingredients, tonumber(data.crafttime), data.receive, data.giveamount)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, data.ingredients)
end)

-- do crafting
RegisterNetEvent('rsg-saloontender:client:craftitem', function(title, category, ingredients, crafttime, receive, giveamount)
    RSGCore.Functions.Progressbar('do-crafting', Lang:t('lang_11')..title..' '..category, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-saloontender:server:finishcrafting', ingredients, receive, giveamount, jobaccess)
    end)
end)

------------------------------------------------------------------------------------------------------
-- storage
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-saloontender:client:storage', function()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    if playerjob == jobaccess then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", jobaccess, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", jobaccess)
    end
end)
