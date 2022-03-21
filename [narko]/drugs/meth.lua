ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)


local used = false
local cooking = false
local filled = false
local process = false
local packaged = false
local methCount = 0
local animacja = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if animacja then
			DisableControlAction(2, 73, true)
			FreezeEntityPosition(true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 1500
		local playerPed = PlayerPedId() 
		local playerCoord = GetEntityCoords(playerPed)
		local dst = #(playerCoord - Config.methLab.entry.coord)
			if dst < 3.5 and not used then
				sleep = 1
				DrawMarker(2, Config.methLab.entry.coord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
				if dst < 3 then
					DrawText3D(Config.methLab.entry.coord.x, Config.methLab.entry.coord.y, Config.methLab.entry.coord.z + 0.20, 0.30, Config.methLab.entry.text)
					if IsControlJustPressed(0, 38) and not used then
						used = true
						if Config.methLab.entry.requiredItem then
							ESX.TriggerServerCallback("drugs:checkItem", function(output) 
								if output then
									SetEntityCoords(playerPed, Config.methLab.entry.coord.x, Config.methLab.entry.coord.y+0.40, Config.methLab.entry.coord.z-1.0)
									SetEntityHeading(playerPed, Config.methLab.entry.entryheading)
									TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)
									teleport(Config.methLab.entry.intcoord, Config.methLab.entry.intheading)
									used = false
								else
									used = false
									ESX.ShowNotification("Nie posiadasz karty dostępu")
								end
							end, "labcard", 1)		
						else
							teleport(Config.methLab.entry.intcoord, Config.methLab.entry.intheading)
							used = false
						end			
					end
				end
			end
		local dst2 = #(playerCoord - Config.methLab.exit.intcoord)
		if dst2 < 10 then
			sleep = 1
			DrawMarker(2, Config.methLab.exit.intcoord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
			if dst2 < 2 then
				DrawText3D(Config.methLab.exit.intcoord.x, Config.methLab.exit.intcoord.y, Config.methLab.exit.intcoord.z + 0.20, 0.30, Config.methLab.exit.text)
				if IsControlJustPressed(0, 38) then
					teleport(Config.methLab.exit.coord, Config.methLab.exit.heading)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)


Citizen.CreateThread(function()
	while true do
		local sleep = 1500
		local playerPed = PlayerPedId()
		local playerCoord = GetEntityCoords(playerPed)
		local dst = #(playerCoord - Config.methLab.cookZone.coord)
		if dst < 10 and not cooking then
			sleep = 1
			DrawMarker(2, Config.methLab.cookZone.coord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
			if dst < 2 and not cooking then
				DrawText3D(Config.methLab.cookZone.coord.x, Config.methLab.cookZone.coord.y, Config.methLab.cookZone.coord.z + 0.20, 0.30, Config.methLab.cookZone.text)
				if IsControlJustPressed(0, 38) and not cooking then
					ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                        if output then
                            ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                                if output then

                            
                                 TriggerEvent("mokotowski:cookMeth")
                                else 
                                 end
                                    
                                                      
                                
                            end, 'ammonia', 1)
                            end
                    end, 'sacid', 1)
				end
			end
		end
			local dst2 = #(playerCoord - Config.methLab.cookZone.startingCoord)
		if dst2 < 10 and filled and cooking then
			sleep = 1
			DrawMarker(2, Config.methLab.cookZone.startingCoord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
			DrawText3D(Config.methLab.cookZone.startingCoord.x, Config.methLab.cookZone.startingCoord.y, Config.methLab.cookZone.startingCoord.z + 0.20, 0.30, Config.methLab.cookZone.startingText)
			if dst < 2 then
				if IsControlJustPressed(0, 38) and filled then
					filled = false
					SetEntityCoords(playerPed, 1007.68, -3200.84, -40.0)
					SetEntityHeading(playerPed, 184.0)
					TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
					Citizen.Wait(20000)
					ClearPedTasks(playerPed)
					ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                        if output then
                            ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                                if output then
                                    ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                                        if output then
                                        ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                                             if output then
                            
                                                        TriggerEvent("mokotowski:processMeth")
                                                        else 
                                                        end
                                    
                                                        end, 'folia', 1)
                                                    else 
                                                end
                                                
                                            end, 'pudelkoniebieskie', 1)
                                    else 
                                end
                                
                            end, 'suwak', 1)
                            
                        else 
                        end
                    end, 'torebka', 1)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("mokotowski:cookMeth")
AddEventHandler("mokotowski:cookMeth", function()
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	cooking = true
	TriggerServerEvent("drugs:removeItem", 'ammonia', 1)
	TriggerServerEvent("drugs:removeItem", 'sacid', 1)
	local sceneCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	RenderScriptCams(true, false, 0, 1, 0)
	SetCamCoord(sceneCam, 1003.36, -3197.88, -39.0)
	PointCamAtEntity(sceneCam, playerPed, 0.0, 0.0, 0.0, 1)
	RequestAnimDict('anim@amb@business@meth@meth_monitoring_cooking@cooking@')
	RequestModel('bkr_prop_meth_sacid')
	RequestModel('bkr_prop_meth_ammonia')
	while not HasAnimDictLoaded('anim@amb@business@meth@meth_monitoring_cooking@cooking@') and not HasModelLoaded("bkr_prop_meth_sacid") and not HasModelLoaded("bkr_prop_meth_ammonia") do Citizen.Wait(30) end
	local ammonia = CreateObject(GetHashKey("bkr_prop_meth_ammonia"), Config.methLab.cookZone.coord.x, Config.methLab.cookZone.coord.y, Config.methLab.cookZone.coord.z, true, false, false)
	local sacid = CreateObject(GetHashKey("bkr_prop_meth_sacid"), Config.methLab.cookZone.coord.x, Config.methLab.cookZone.coord.y, Config.methLab.cookZone.coord.z, true, false, false)
	SetEntityHeading(playerPed, 178.56)
	Citizen.Wait(100)
	local cookingScene = NetworkCreateSynchronisedScene(Config.methLab.cookZone.coord.x+4.84, Config.methLab.cookZone.coord.y+1.99, Config.methLab.cookZone.coord.z-0.40, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(playerPed, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(ammonia, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_ammonia", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(sacid, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_sacid", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(cookingScene)
	Citizen.Wait(56000)
	NetworkStopSynchronisedScene(cookingScene)
	ClearFocus()
	RenderScriptCams(false, false, 0, 1, 0)
	DestroyCam(sceneCam, false)
	DeleteEntity(ammonia)
	DeleteEntity(sacid)
	filled = true
	animacja = false
	FreezeEntityPosition(playerPed, false)

end)

RegisterNetEvent("mokotowski:processMeth")
AddEventHandler("mokotowski:processMeth", function()
	local taken = false
	local count = math.random(Config.methLab.cookZone.methMinCount, Config.methLab.cookZone.methMaksCount)
	animacja = true
	exports['progressBars']:startUI((90000), 'Przetwarzanie mocnych kwasów')
	Citizen.Wait(90000)
	animacja = false
	ESX.ShowNotification('Proces gotowania zakończony, zbierz swoją substancje')
	while true do
		local playerPed = PlayerPedId()
		local playerCoord = GetEntityCoords(playerPed)
		local dst = #(playerCoord - Config.methLab.cookZone.coord)
		if dst < 10 then
			DrawMarker(2, Config.methLab.cookZone.coord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
			DrawText3D(Config.methLab.cookZone.coord.x, Config.methLab.cookZone.coord.y, Config.methLab.cookZone.coord.z + 0.20, 0.30, Config.methLab.cookZone.takeMethText)
		end
		if dst < 2 then
			if IsControlJustPressed(0, 38) then
				TriggerServerEvent("drugs:giveItem", 'meth', count)
				TriggerServerEvent("drugs:removeItem", 'torebka', 1)
				TriggerServerEvent("drugs:removeItem", 'suwak', 1)
				TriggerServerEvent("drugs:removeItem", 'łopatka', 1)
				TriggerServerEvent("drugs:removeItem", 'pudelkoniebieskie', 1)
				cooking = false
				filled = false	
				taken = true
			end
		end
		if taken then
			break
		end
		Citizen.Wait(1)
	end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoord = GetEntityCoords(playerPed)
        local dst = #(playerCoord - Config.methLab.packageZone.coord)
        if dst < 10 and not process then
            sleep = 1
            DrawMarker(2, Config.methLab.packageZone.coord, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, false, 1, false, false, false)
            if dst < 3 then
                DrawText3D(Config.methLab.packageZone.coord.x, Config.methLab.packageZone.coord.y, Config.methLab.packageZone.coord.z + 0.20, 0.30, Config.methLab.packageZone.text)
                if IsControlJustPressed(0, 38) then
                    ESX.TriggerServerCallback("drugs:checkItem", function(output) 
                        if output then
                            methCount = 1
                            TriggerEvent("mokotowski:packageMeth")
                            process = true
                            TriggerEvent("mokotowski:disableControl")
                        else
                            ESX.ShowNotification("Nie posiadasz metaamfetaminy")
                        end
                    end, 'meth', 1)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent("mokotowski:packageMeth")
AddEventHandler("mokotowski:packageMeth", function()
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	RequestAnimDict('anim@amb@business@meth@meth_smash_weight_check@')
	while not HasAnimDictLoaded('anim@amb@business@meth@meth_smash_weight_check@') do Citizen.Wait(10) end
	RequestModel('bkr_prop_meth_bigbag_04a')
	RequestModel('bkr_prop_meth_bigbag_03a')
	RequestModel('bkr_prop_fakeid_clipboard_01a')
	RequestModel('bkr_prop_meth_openbag_02')
	RequestModel('bkr_prop_fakeid_penclipboard')
	RequestModel('bkr_prop_coke_scale_01')
	RequestModel('bkr_prop_meth_scoop_01a')
	while not HasModelLoaded('bkr_prop_meth_bigbag_04a') and not HasModelLoaded('bkr_prop_meth_bigbag_03a') and not HasModelLoaded('bkr_prop_fakeid_clipboard_01a') and not HasModelLoaded('bkr_prop_meth_openbag_02') and not HasModelLoaded('bkr_prop_fakeid_penclipboard') and not HasModelLoaded('bkr_prop_coke_scale_01') and not HasModelLoaded('bkr_prop_meth_scoop_01a') do 
		Citizen.Wait(50)
	end
	local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
	SetEntityHeading(playerPed, 0.86)
	local packageScene = NetworkCreateSynchronisedScene(Config.methLab.packageZone.coord.x-4.72, Config.methLab.packageZone.coord.y-1.64, Config.methLab.packageZone.coord.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene2 = NetworkCreateSynchronisedScene(Config.methLab.packageZone.coord.x-4.72, Config.methLab.packageZone.coord.y-1.64, Config.methLab.packageZone.coord.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene3 = NetworkCreateSynchronisedScene(Config.methLab.packageZone.coord.x-4.72, Config.methLab.packageZone.coord.y-1.64, Config.methLab.packageZone.coord.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene4 = NetworkCreateSynchronisedScene(Config.methLab.packageZone.coord.x-4.72, Config.methLab.packageZone.coord.y-1.64, Config.methLab.packageZone.coord.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene5 = NetworkCreateSynchronisedScene(Config.methLab.packageZone.coord.x-4.72, Config.methLab.packageZone.coord.y-1.64, Config.methLab.packageZone.coord.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	Citizen.Wait(10)
	local box01 = CreateObject(GetHashKey("bkr_prop_meth_bigbag_04a"), Config.methLab.packageZone.coord, 1, 0, 0)
	local box02 = CreateObject(GetHashKey("bkr_prop_meth_bigbag_03a"), Config.methLab.packageZone.coord, 1, 0, 0)
	local clipboard = CreateObject(GetHashKey("bkr_prop_fakeid_clipboard_01a"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag01 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag02 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag03 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag04 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag05 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag06 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local methbag07 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.methLab.packageZone.coord, 1, 0, 0)
	local pencil = CreateObject(GetHashKey("bkr_prop_fakeid_penclipboard"), Config.methLab.packageZone.coord, 1, 0, 0)
	local scale = CreateObject(GetHashKey("bkr_prop_coke_scale_01"), Config.methLab.packageZone.coord, 1, 0, 0)
	local scoop = CreateObject(GetHashKey("bkr_prop_meth_scoop_01a"), Config.methLab.packageZone.coord, 1, 0, 0)
	NetworkAddPedToSynchronisedScene(playerPed, packageScene, animDict, "break_weigh_v3_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(box01, packageScene, animDict, "break_weigh_v3_box01", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(box02, packageScene, animDict, "break_weigh_v3_box01^1", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(clipboard, packageScene, animDict, "break_weigh_v3_clipboard", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag01, packageScene2, animDict, "break_weigh_v3_methbag01", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag02, packageScene2, animDict, "break_weigh_v3_methbag01^1", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag03, packageScene2, animDict, "break_weigh_v3_methbag01^2", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag04, packageScene3, animDict, "break_weigh_v3_methbag01^3", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag05, packageScene3, animDict, "break_weigh_v3_methbag01^4", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag06, packageScene3, animDict, "break_weigh_v3_methbag01^5", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag07, packageScene4, animDict, "break_weigh_v3_methbag01^6", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(pencil, packageScene4, animDict, "break_weigh_v3_pen", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(scale, packageScene4, animDict, "break_weigh_v3_scale", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(scoop, packageScene5, animDict, "break_weigh_v3_scoop", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(packageScene)
	NetworkStartSynchronisedScene(packageScene2)
	NetworkStartSynchronisedScene(packageScene3)
	NetworkStartSynchronisedScene(packageScene4)
	NetworkStartSynchronisedScene(packageScene5)
	Citizen.Wait(39800)
	NetworkStopSynchronisedScene(packageScene)
	NetworkStopSynchronisedScene(packageScene2)
	NetworkStopSynchronisedScene(packageScene3)
	NetworkStopSynchronisedScene(packageScene4)
	NetworkStopSynchronisedScene(packageScene5)
	DeleteEntity(box02)
	DeleteEntity(box01)
	DeleteEntity(clipboard)
	DeleteEntity(methbag01)
	DeleteEntity(methbag02)
	DeleteEntity(methbag03)
	DeleteEntity(methbag04)
	DeleteEntity(methbag05)
	DeleteEntity(methbag06)
	DeleteEntity(methbag07)
	DeleteEntity(pencil)
	DeleteEntity(scale)
	DeleteEntity(scoop)
	TriggerServerEvent("drugs:removeItem", 'meth', 1)
	local x 
	x = math.random(1,100)
	   if x <= 10  then
	   TriggerServerEvent("drugs:giveItem", 'packagedmethmslaba', 1)
	   elseif x <= 40 then
		   TriggerServerEvent("drugs:giveItem", 'packagedmethsrednia', 1)
	   else 
		   TriggerServerEvent("drugs:giveItem", 'packagedmethmocna', 1)

	   end
	
	packaged = false
	process = false
	methCount = 0
	packaged = false
	FreezeEntityPosition(playerPed, false)

end)

function teleport(coord, heading)
	DoScreenFadeOut(500)
	Citizen.Wait(2000)
	SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0)
	SetEntityHeading(PlayerPedId(), heading)
	DoScreenFadeIn(500)
end

function DrawText3D(x, y, z, scale, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    -- local scale = 0.35
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 200
        DrawRect(_x, _y + 0.0120, 0.0 + factor, 0.025, 41, 11, 41, 100)
    end
end


