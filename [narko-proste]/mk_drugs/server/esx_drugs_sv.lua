ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)                               
				HarvestCoke(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Koks] ' .. GetPlayerName(source) .. ' ID ' .. id ..' KOKS ZBIORKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startHarvestCoke')
AddEventHandler('esx_urp:startHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
        
	HarvestCoke(_source)

end)

RegisterServerEvent('esx_urp:stopHarvestCoke')
AddEventHandler('esx_urp:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_pooch', 1)
				TransformCoke(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Koks] ' .. GetPlayerName(source) .. ' ID ' .. id ..' KOKS PRZEROBKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startTransformCoke')
AddEventHandler('esx_urp:startTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_urp:stopTransformCoke')
AddEventHandler('esx_urp:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)



--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Meta] ' .. GetPlayerName(source) .. ' ID ' .. id ..' META ZBIORKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startHarvestMeth')
AddEventHandler('esx_urp:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_urp:stopHarvestMeth')
AddEventHandler('esx_urp:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)
				TransformMeth(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Meta] ' .. GetPlayerName(source) .. ' ID ' .. id ..' META PRZEROBKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startTransformMeth')
AddEventHandler('esx_urp:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_urp:stopTransformMeth')
AddEventHandler('esx_urp:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)



--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[ZIOLO] ' .. GetPlayerName(source) .. ' ID ' .. id ..' WEED ZBIORKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startHarvestWeed')
AddEventHandler('esx_urp:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_urp:stopHarvestWeed')
AddEventHandler('esx_urp:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)
				TransformWeed(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Ziolo] ' .. GetPlayerName(source) .. ' ID ' .. id ..' WEED PRZEROBKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startTransformWeed')
AddEventHandler('esx_urp:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_urp:stopTransformWeed')
AddEventHandler('esx_urp:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)



--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Opium] ' .. GetPlayerName(source) .. ' ID ' .. id ..' OPIUM ZBIORKA (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startHarvestOpium')
AddEventHandler('esx_urp:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_urp:stopHarvestOpium')
AddEventHandler('esx_urp:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
				TransformOpium(source)

				local steam = xPlayer.identifier
				local id = source
				sendToDiscord('esx_drugs','[Opium] ' .. GetPlayerName(source) .. ' ID ' .. id ..' OPIUM Przerobka (' .. steam ..') !' ,3999999)
			end

		end
	end)
end

RegisterServerEvent('esx_urp:startTransformOpium')
AddEventHandler('esx_urp:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_urp:stopTransformOpium')
AddEventHandler('esx_urp:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)



RegisterServerEvent('esx_urp:GetUserInventory')
AddEventHandler('esx_urp:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_urp:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
	)
end)

function sendToDiscord (name,message,color)
	local DiscordWebHook = 'https://discord.com/api/webhooks/809410838850175026/KOzSqCTftCESHMRn_yS1Co7SGPpWI57Luv7Nwd-NYCtdvnQCBOT0e6uXBrzrkvBCO_qR'
  local embeds = {
	  {
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "esx_drugs",
		 },
	  }
  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
