
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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local JobBlips                = {}
local publicBlip = false
local CzyJest                 	= false
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function TeleportFadeEffect(entity, coords)

	Citizen.CreateThread(function()

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)
		end)

	end)
end

function OpenkurierActionsMenu()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('cloakroom'),
			align    = 'center',
			elements = {
				{label = 'Ubranie Cywilne', value = 'citizen_wear'},
				{label = 'Ubranie Robocze', value = 'kurier_wear'},
				{label = 'Zarządzanie firmą', value = 'boss_actions'},
			},
		},
		function(data, menu)

			menu.close()
			
			if data.current.value == 'boss_actions' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and PlayerData.job.grade_name == 'boss' then
				TriggerEvent('esx_society:openBossMenuhype2', 'kurier', function(data, menu)
					menu.close()
				end)
			end
			
			if data.current.value == 'boss_actions' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and PlayerData.job.grade_name == 'recrue' then
				TriggerEvent("pNotify:SendNotification", {text = "Nie jesteś szefem firmy", type = "error", timeout = 3000, layout = "centerLeft"})
			end

			if data.current.value == 'citizen_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if data.current.value == 'kurier_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
				end)
			end

			CurrentAction     = 'kurier_actions_menu'
			CurrentActionMsg  = _U('open_menu')
			CurrentActionData = {}
		end,
		function(data, menu)
			menu.close()
		end
	)

end



function OpenVehicleSpawnerMenu()



				local model = 'boxville4'
		
				ESX.Game.SpawnVehicle(model, Config.Zones.VehicleSpawnPoint.Pos, 157.93, function(vehicle)
					local playerPed = GetPlayerPed(-1)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				end)




				CurrentAction     = 'vehicle_spawner_menu'
				CurrentActionData = {}

			end








RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

AddEventHandler('esx_kurier:hasEnteredMarker', function(zone)
	local playerPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player,false)
	
	if zone == 'Paczka1' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'raisin_harvest'
		ESX.ShowAdvancedNotification('Pakowanie', 'Kurier', '~g~[E] ~y~aby zapakowac przedmioty', 'CHAR_JOE', 8)
		CurrentActionData = {zone= zone}
	end

	if zone == 'Paczkaems' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'raisin_harvest2'
		ESX.ShowAdvancedNotification('Rozpakowanie', 'Kurier', '~g~[E] ~y~aby rozpakowac przedmioty', 'CHAR_JOE', 8)
		CurrentActionData = {zone= zone}
	end
	
	if zone == 'Paczka2' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'raisin_harvest3'
		ESX.ShowAdvancedNotification('Rozpakowanie', 'Kurier', '~g~[E] ~y~aby rozpakowac przedmioty', 'CHAR_JOE', 8)
		CurrentActionData = {zone= zone}
	end
	
	if zone == 'Paczkalspd' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'raisin_harvest4'
		ESX.ShowAdvancedNotification('Rozpakowanie', 'Kurier', '~g~[E] ~y~aby rozpakowac przedmioty', 'CHAR_JOE', 8)
		CurrentActionData = {zone= zone}
	end
			
	if zone == 'SellFarm' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'farm_resell'
		ESX.ShowAdvancedNotification('Wyplata', 'Kurier', '~g~[E] ~y~aby odebrac wyplate', 'CHAR_JOE', 8)
		CurrentActionData = {zone = zone}
	end

	if zone == 'kurierronActions' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'kurier_actions_menu'
		ESX.ShowAdvancedNotification('Szatnia', 'Kurier', '~g~[E] ~y~aby skorzystac z szatni', 'CHAR_JOE', 8)
		CurrentActionData = {}
	end
  
	if zone == 'VehicleSpawner' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		CurrentAction     = 'vehicle_spawner_menu'
		ESX.ShowAdvancedNotification('Szatnia', 'Kurier', '~g~[E] ~y~aby pobrac samochod', 'CHAR_JOE', 8)
		CurrentActionData = {}
	end
		
	if zone == 'VehicleDeleter' and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		
		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle, distance = ESX.Game.GetClosestVehicle({
				x = coords.x,
				y = coords.y,
				z = coords.z
			})

			if distance ~= -1 and distance <= 1.0 then

				CurrentAction     = 'delete_vehicle'
				ESX.ShowAdvancedNotification('Wyciaganie Samochodu', 'Kurier', '~g~[E] ~y~aby schowac samochod', 'CHAR_JOE', 8)
				CurrentActionData = {vehicle = vehicle}

			end
		end
	end
end)

AddEventHandler('esx_kurier:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	if (zone == 'Paczka1') and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		TriggerServerEvent('esx_kurier:stopHarvest')
	end

	if (zone == 'Paczkaems') and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		TriggerServerEvent('esx_kurier:stopHarvest')
	end 

	if (zone == 'Paczka2') and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		TriggerServerEvent('esx_kurier:stopHarvest')
	end

	if (zone == 'Paczkalspd') and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		TriggerServerEvent('esx_kurier:stopHarvest')
	end  
 
	if (zone == 'SellFarm') and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
		TriggerServerEvent('esx_kurier:stopSell')
	end
	CurrentAction = nil
end)




function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

-- Create Blips
function blips()
	
    if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then

		for k,v in pairs(Config.BlipJablka)do
			if v.Type == 27 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 227)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 1.0)
				SetBlipColour (blip2, 19)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end

		for k,v in pairs(Config.BlipReszta)do
			if v.Type == 32 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 227)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 1.0)
				SetBlipColour (blip4, 75)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
	end
end


-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)


-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_kurier:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_kurier:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
				if CurrentAction == 'raisin_harvest' then				
					TriggerServerEvent('esx_kurier:startHarvest', CurrentActionData.zone)
				end
				
				if CurrentAction == 'raisin_harvest2' then
					TriggerServerEvent('esx_kurier:startHarvest2', CurrentActionData.zone)
				end
				
				if CurrentAction == 'raisin_harvest3' then
					TriggerServerEvent('esx_kurier:startHarvest3', CurrentActionData.zone)
				end
				
				if CurrentAction == 'raisin_harvest4' then
					TriggerServerEvent('esx_kurier:startHarvest4', CurrentActionData.zone)
				end
				
				if CurrentAction == 'farm_resell' then
					TriggerServerEvent('esx_kurier:startSell', CurrentActionData.zone)
				end
				
				if CurrentAction == 'kurier_actions_menu' then
					OpenkurierActionsMenu()
				end
				if CurrentAction == 'vehicle_spawner_menu' then
					OpenVehicleSpawnerMenu()
				end
				if CurrentAction == 'delete_vehicle' then

					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'kurier', vehicleProps)
					end

					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end

				CurrentAction = nil

			end
		end
	end
end)

AddEventHandler('esx_kurier:hasExitedMarker', function(zone)
	TriggerServerEvent('esx_jobs:stopWork')
	hintToDisplay = "no hint to display"
	menuIsShowed = false
	hintIsShowed = false
	isInMarker = false
end)

RegisterNetEvent('kurier:freezePlayer')
AddEventHandler('kurier:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait(10)
    end
end

--3D
function DrawText3D(x, y, z, text, scale)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

  SetTextScale(scale, scale)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextEntry("STRING")
  SetTextCentre(1)
  SetTextColour(255, 255, 255, 255)
  SetTextOutline()

  AddTextComponentString(text)
  DrawText(_x, _y)

  local factor = (string.len(text)) / 270
  DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end

RegisterNetEvent('kurier:procenty')
AddEventHandler('kurier:procenty', function()
  CzyJest = true
    while (CzyJest) do
      Citizen.Wait(8)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Pracuje...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

RegisterNetEvent('kurier:procenty2')
AddEventHandler('kurier:procenty2', function()
  CzyJest = true
    while (CzyJest) do
      Citizen.Wait(8)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Sprzedawanie...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)


--Licznik
  function procent(time)
	TriggerEvent('kurier:procenty')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
	cooldownclick = false
  end


--Licznik
  function procent2(time)
	TriggerEvent('kurier:procenty2')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
	cooldownclick = false
  end



function animka1()
	local dict = "oddjobs@shop_robbery@rob_till"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	Citizen.Wait(10)
	end
	TaskPlayAnim(GetPlayerPed(-1), dict, "loop", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

					
function animka2()
	local dict = "mini@repair"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	Citizen.Wait(10)
	end
	TaskPlayAnim(GetPlayerPed(-1), dict, "fixing_a_ped", 1.5, -8.0, 10000, 1, 0, false, false, false)
end


function animka3()
	local dict = "amb@prop_human_atm@male@enter"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	Citizen.Wait(10)
	end
	TaskPlayAnim(GetPlayerPed(-1), dict, "enter", 1.5, -8.0, 4000, 1, 0, false, false, false)
end
--Zbieranie rzeczy

--LSPD

RegisterNetEvent('esx_kurier:startHarvestLSPD1')
AddEventHandler('esx_kurier:startHarvestLSPD1', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka1()
	TriggerServerEvent('esx_kurier:startHarvestLSPD2')
	procent(95)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)



--EMS

RegisterNetEvent('esx_kurier:StartHarvestMedic1')
AddEventHandler('esx_kurier:StartHarvestMedic1', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka1()
	TriggerServerEvent('esx_kurier:StartHarvestMedic2')
	procent(95)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)

--Przerabianie na karty 

--LSPD

RegisterNetEvent('esx_kurier:startHarvestLSPD3')
AddEventHandler('esx_kurier:startHarvestLSPD3', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka2()
	TriggerServerEvent('esx_kurier:startHarvestLSPD4')
	procent(95)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)


--EMS	

RegisterNetEvent('esx_kurier:startHarvestMedic3')
AddEventHandler('esx_kurier:startHarvestMedic3', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka2()
	TriggerServerEvent('esx_kurier:StartHarvestMedic4')
	procent(95)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)		


--SELL

RegisterNetEvent('esx_kurier:sellkartalspd')
AddEventHandler('esx_kurier:sellkartalspd', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka3()
	TriggerServerEvent('esx_kurier:sellkartalspd2')
	procent2(30)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)

RegisterNetEvent('esx_kurier:sellkartaems')
AddEventHandler('esx_kurier:sellkartaems', function()
	FreezeEntityPosition(PlayerPedId(), true)
	animka3()
	TriggerServerEvent('esx_kurier:sellkartaems2')
	procent2(30)
	FreezeEntityPosition(PlayerPedId(), false)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
end)






