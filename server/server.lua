local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-saloontender/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-----------------------------------------------------------------------

-- check player has the ingredients
RSGCore.Functions.CreateCallback('rsg-saloontender:server:checkingredients', function(source, cb, ingredients)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    for k, v in pairs(ingredients) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount then
            icheck = icheck + 1
            if icheck == #ingredients then
                cb(true)
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Error', description = Lang:t('lang_12'), type = 'error', duration = 5000 })
            cb(false)
            return
        end
    end
end)

-- finish crafting
RegisterServerEvent('rsg-saloontender:server:finishcrafting')
AddEventHandler('rsg-saloontender:server:finishcrafting', function(ingredients, receive, giveamount, job)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    -- remove ingredients
    for k, v in pairs(ingredients) do
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        Player.Functions.RemoveItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[v.item], "remove")
    end
    -- add stock
    MySQL.query('SELECT * FROM saloontender_stock WHERE saloontender = ? AND item = ?',{job, receive} , function(result)
        if result[1] ~= nil then
            local stockadd = result[1].stock + giveamount
            MySQL.update('UPDATE saloontender_stock SET stock = ? WHERE saloontender = ? AND item = ?',{stockadd, job, receive})
        else
            MySQL.insert('INSERT INTO saloontender_stock (`saloontender`, `item`, `stock`) VALUES (?, ?, ?);', {job, receive, giveamount})
        end
    end)
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
