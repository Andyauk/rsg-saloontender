local RSGCore = exports['rsg-core']:GetCoreObject()
local PlayerData = RSGCore.Functions.GetPlayerData()
local currentname
local currentzone

-----------------------------------------------------------------------------------

-- job prompts and blips
Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'rsg-saloontender:client:mainmenu',
            args = { v.location, v.coords },
        })
        if v.showblip == true then
            local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, Config.Blip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------

-- saloontender menu
RegisterNetEvent('rsg-saloontender:client:mainmenu', function(name, zone)
    local job = RSGCore.Functions.GetPlayerData().job.name
    if job == name then
        currentname = name
        currentzone = zone
        local options = {
            {
                title = "Saloon Storage",
                icon = "fa-solid fa-box-open",
                event = "rsg-saloontender:client:storage",
                args = {}
            },
            {
                title = "Saloon Supplies",
                icon = "fa-solid fa-store",
                event = "rsg-saloontender:client:shop",
                args = {}
            },
            {
                title = "DukeBox",
                icon = "fa-solid fa-circle-play",
                event = "rsg-saloontender:client:musicmenu",
                args = {}
            },
            {
                title = "Job Management",
                icon = "fas fa-user-circle",
                event = "rsg-bossmenu:client:OpenMenu",
                args = {}
            },
        }

        lib.registerContext({
            id = "saloon_menu",
            title = "Saloon Tender",
            options = options
        })

        lib.showContext("saloon_menu")
    else
        RSGCore.Functions.Notify('you are not authorised!', 'error')
    end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('rsg-saloontender:client:storage', function()
    local job = RSGCore.Functions.GetPlayerData().job.name
    local stashloc = currentname
    if job == currentname then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashloc, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashloc)
    end
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('rsg-saloontender:client:musicmenu', function()
    local name = currentname
    local zone = currentzone
    local options = {
        {
            title = "Play Music",
            icon = "fa-solid fa-circle-play",
            event = "rsg-saloontender:client:playMusic",
            args = {}
        },
        {
            title = "Pause Music",
            icon = "fa-solid fa-store",
            event = "rsg-saloontender:client:pauseMusic",
            args = {}
        },
        {
            title = "Resume Music",
            icon = "fa-solid fa-rotate-right",
            event = "rsg-saloontender:client:resumeMusic",
            args = {}
        },
        {
            title = "Change Volume",
            icon = "fa-solid fa-volume-high",
            event = "rsg-saloontender:client:changeVolume",
            args = {}
        },
        {
            title = "Turn off music",
            icon = "fa-solid fa-circle-stop",
            event = "rsg-saloontender:client:stopMusic",
            args = {}
        },
    }

    lib.registerContext({
        id = "dukebox_menu",
        title = "Duke Box",
        options = options
    })

    lib.showContext("dukebox_menu")
end)

RegisterNetEvent('rsg-saloontender:client:playMusic', function()
    local input = lib.inputDialog('Song Selection', {'YouTube URL'})
    if not input then return end
    local song = input[1]
    if song then
        TriggerServerEvent('rsg-saloontender:server:playMusic', song, currentname, currentzone)
    end
end)

-- change volume
RegisterNetEvent('rsg-saloontender:client:changeVolume', function()
    local input = lib.inputDialog('Music Volume', {
        {type = 'slider', label = 'Min: 0.01 - Max: 1', icon = {'far', 'music'}, required = true, default = 0.5, min = 0.01, max = 1, step = 0.01}
    })
    if not input then return end
    local volume = input[1]
    if volume then
        TriggerServerEvent('rsg-saloontender:server:changeVolume', volume, currentname, currentzone)
    end
end)

-- pause music
RegisterNetEvent('rsg-saloontender:client:pauseMusic', function()
    TriggerServerEvent('rsg-saloontender:server:pauseMusic', currentname, currentzone)
end)

-- resume music
RegisterNetEvent('rsg-saloontender:client:resumeMusic', function()
    TriggerServerEvent('rsg-saloontender:server:resumeMusic', currentname, currentzone)
end)

-- stop music
RegisterNetEvent('rsg-saloontender:client:stopMusic', function()
    TriggerServerEvent('rsg-saloontender:server:stopMusic', currentname, currentzone)
end)
