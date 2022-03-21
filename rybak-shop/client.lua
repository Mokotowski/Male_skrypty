local Keys = {
 ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
 ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
 ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
 ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
 ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
 ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
 ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
 ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
 ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
   
ESX = nil
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local blips = {
      {title="Rybak", colour=81, id=683, x = -1585.07, y = -838.42, z = 9.9}
}
 
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.1)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Rybak")
      EndTextCommandSetBlipName(info.blip)
    end
end)
  
local gym = {
    {x = -1585.07, y = -838.42, z = 9.9}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        for k in pairs(gym) do
            DrawMarker(29, gym[k].x, gym[k].y, gym[k].z, 0, 0, 0, 90, 0, 0, 1.201, 1.201, 1.201, 0, 153, 255, 180, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(45)

        for k in pairs(gym) do
		
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

            if dist <= 0.5 then
				hintToDisplay('Wciśnij ~INPUT_CONTEXT~ aby otworzyć menu~w~')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenPawnMenumain()
				end			
            end
        end
    end
end)

function OpenPawnMenumain()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_menu',
        {
            title    = 'Rybak',
            align    = 'bottom-left',
            elements = {
				{label = 'Kup', value = 'shop'},
                {label = 'Sprzedaj', value = 'sell'},

            }
        },
        function(data, menu)
            if data.current.value == 'shop' then
				OpenPawnShopMenu()
            elseif data.current.value == 'sell' then
				OpenSellMenu()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenPawnShopMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_shop_menu',
        {
            title    = 'Rybak - Kup',
            align    = 'bottom-left',
            elements = {
				{label = 'Folia do paczek - 175$', value = 'folia'},
                {label = 'Suwak - 45$', value = 'suwak'},
                {label = 'Wędka - 100$', value = 'wedka'},
                {label = 'Sód - 25$', value = 'sacid'},
                {label = 'Amoniak - 50$', value = 'ammonia'},
                

                }
        },
        function(data, menu)
            if data.current.value == 'folia' then
				TriggerServerEvent('Rybak:folia')
            end
            if data.current.value == 'suwak' then
				TriggerServerEvent('Rybak:suwak')
            end
            if data.current.value == 'wedka' then
				TriggerServerEvent('Rybak:wedka')
            end
            if data.current.value == 'sacid' then
				TriggerServerEvent('Rybak:sacid')
            end
            if data.current.value == 'ammonia' then
				TriggerServerEvent('Rybak:ammonia')
            end

        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenSellMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_sell_menu',
        {
            title    = 'Rybak - Sprzedaj',
            align    = 'bottom-left',
            elements = {
                {label = 'Mała ryba - 150$', value = 'malaryba'},
                {label = 'Ryba - 225$', value = 'ryba'},
                {label = 'Duża ryba - 300$', value = 'duzaryba'},
            }
        },
        function(data, menu)

            if data.current.value == 'malaryba' then
				TriggerServerEvent('Rybak:malaryba')

            elseif data.current.value == 'ryba' then
				TriggerServerEvent('Rybak:ryba')

            elseif data.current.value == 'duzaryba' then
				TriggerServerEvent('Rybak:duzaryba')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end





