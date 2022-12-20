local QRCore = exports['qr-core']:GetCoreObject()
local currentname
local currentzone

-----------------------------------------------------------------------------------

-- job prompts and blips
Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qr-core']:createPrompt(v.location, v.coords, QRCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
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

-- job draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            local job = QRCore.Functions.GetPlayerData().job.name
            if job == Config.JobRequired then
                for saloontender, v in pairs(Config.SaloonTenderLocations) do
                    if v.showmarker == true then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-----------------------------------------------------------------------------------

-- saloontender menu
RegisterNetEvent('rsg-saloontender:client:mainmenu', function(name, zone)
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        currentname = name
        currentzone = zone
        exports['qr-menu']:openMenu({
            {
                header = 'Saloon Tender',
                isMenuHeader = true,
            },
            {
                header = "Saloon Storage",
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'rsg-saloontender:client:storage',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = "DukeBox",
                txt = "",
                icon = "fas fa-music",
                params = {
                    event = 'rsg-saloontender:client:musicmenu',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = "Job Management",
                txt = "",
                icon = "fas fa-user-circle",
                params = {
                    event = 'qr-bossmenu:client:OpenMenu',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = ">> Close Menu <<",
                txt = '',
                params = {
                    event = 'qr-menu:closeMenu',
                }
            },
        })
    else
        QRCore.Functions.Notify('you are not a Saloon Tender!', 'error')
    end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('rsg-saloontender:client:storage', function()
    local job = QRCore.Functions.GetPlayerData().job.name
    local stashloc = currentlocation
    if job == Config.JobRequired then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashloc, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashloc)
    end
end)

-----------------------------------------------------------------------------------

-- wholesale prompts and blips
Citizen.CreateThread(function()
    for saloonwholesale, v in pairs(Config.SaloonWholesaleLocations) do
        exports['qr-core']:createPrompt(v.location, v.coords, QRCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'rsg-saloontender:client:openwholesale',
            args = { v.location },
        })
        if v.showblip == true then
            local SaloonWholesaleBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SaloonWholesaleBlip, GetHashKey(Config.WholesaleBlip.blipSprite), true)
            SetBlipScale(SaloonWholesaleBlip, Config.WholesaleBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SaloonWholesaleBlip, Config.WholesaleBlip.blipName)
        end
    end
end)

-- wholesale draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            local job = QRCore.Functions.GetPlayerData().job.name
            if job == Config.JobRequired then
                for saloontender, v in pairs(Config.SaloonWholesaleLocations) do
                    if v.showmarker == true then
                        Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- saloon wholesale
RegisterNetEvent('rsg-saloontender:client:openwholesale')
AddEventHandler('rsg-saloontender:client:openwholesale', function()
    local job = QRCore.Functions.GetPlayerData().job.name
    if job == Config.JobRequired then
        local ShopItems = {}
        ShopItems.label = "Saloon Wholesale"
        ShopItems.items = Config.SaloonWholesale
        ShopItems.slots = #Config.SaloonWholesale
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "SaloonWholesale_"..math.random(1, 99), ShopItems)
    else
        QRCore.Functions.Notify('you don\'t have the required job', 'error')
    end
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('rsg-saloontender:client:musicmenu', function()
    local name = currentname
    local zone = currentzone
    exports['qr-menu']:openMenu({
        {
            header = "💿 | DukeBox Menu",
            isMenuHeader = true,
        },
        {
            header = "🎶 | Play Music",
            txt = "Enter a youtube URL",
            params = {
                event = "rsg-saloontender:client:playMusic",
                isServer = false,
                args = {},
            }
        },
        {
            header = "⏸️ | Pause Music",
            txt = "Pause currently playing music",
            params = {
                event = "rsg-saloontender:client:pauseMusic",
                isServer = false,
                args = {},
            }
        },
        {
            header = "▶️ | Resume Music",
            txt = "Resume playing paused music",
            params = {
                event = "rsg-saloontender:client:resumeMusic",
                isServer = false,
                args = {},
            }
        },
        {
            header = "🔈 | Change Volume",
            txt = "Adjust the volume of the music",
            params = {
                event = "rsg-saloontender:client:changeVolume",
                isServer = false,
                args = {},
            }
        },
        {
            header = "❌ | Turn off music",
            txt = "Stop the music & choose a new song",
            params = {
                event = "rsg-saloontender:client:stopMusic",
                isServer = false,
                args = {},
            }
        },
        {
            header = "<< Back",
            txt = '',
            params = {
                event = 'rsg-saloontender:client:mainmenu',
            }
        },
    })
end)

RegisterNetEvent('rsg-saloontender:client:playMusic', function()
    local dialog = exports['qr-input']:ShowInput({
        header = 'Song Selection',
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'song',
                text = 'YouTube URL'
            }
        }
    })
    if dialog then
        if not dialog.song then return end
        TriggerServerEvent('rsg-saloontender:server:playMusic', dialog.song, currentname, currentzone)
    end
end)

-- change volume
RegisterNetEvent('rsg-saloontender:client:changeVolume', function()
    local dialog = exports['qr-input']:ShowInput({
        header = 'Music Volume',
        submitText = "Submit",
        inputs = {
            {
                type = 'text', -- number doesn't accept decimals??
                isRequired = true,
                name = 'volume',
                text = 'Min: 0.01 - Max: 1'
            }
        }
    })
    if dialog then
        if not dialog.volume then return end
        TriggerServerEvent('rsg-saloontender:server:changeVolume', dialog.volume, currentname, currentzone)
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
