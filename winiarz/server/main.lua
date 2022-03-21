
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local wino = 1

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'winiarz', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'winiarz', 'winiarz', 'society_winiarz', 'society_winiarz', 'society_winiarz', {type = 'public'})

RegisterServerEvent('esx_winiarz:startHarvest')
AddEventHandler('esx_winiarz:startHarvest', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('winogrono').count
	
	if itemQuantity == 40 or itemQuantity > 31 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz już miejsca w torbie na winogrono',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
	return
	end
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_winiarz:startHarvest2', source)
	end)

RegisterServerEvent('esx_winiarz:startHarvest3')
AddEventHandler('esx_winiarz:startHarvest3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	


			Citizen.Wait(10000)
			xPlayer.addInventoryItem('winogrono', 10)
			end)
















RegisterServerEvent('esx_winiarz:startTransform2')
AddEventHandler('esx_winiarz:startTransform2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local winogrono = xPlayer.getInventoryItem('winogrono').count
	local miasz1 = xPlayer.getInventoryItem('miasz').count
		
		
	if winogrono < 10 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz niewystarczającą ilość winogron',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	elseif miasz1 == 20 or miasz1 > 20 then

		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Posiadasz za duzo miaszu',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	return
	else

		PlayersHarvesting[_source]=true
			TriggerClientEvent('esx_winiarz:startTransform3', source)
			end
			end)

RegisterServerEvent('esx_winiarz:startTransform4')
AddEventHandler('esx_winiarz:startTransform4', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

		
		



			Citizen.Wait(10000)
			xPlayer.removeInventoryItem('winogrono', 10)
			xPlayer.addInventoryItem('miasz', 5)
			end)

















RegisterServerEvent('esx_winiarz:startTransform')
AddEventHandler('esx_winiarz:startTransform', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local miasz = xPlayer.getInventoryItem('miasz').count
	local wino1 = xPlayer.getInventoryItem('wino').count

		
	if miasz < 5 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz niewystarczającą ilość miąszu w torbie',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	elseif wino1 == 20 or wino1 > 20 then

		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz za duzo wina przy sobie',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	return
	else

		PlayersHarvesting[_source]=true
			TriggerClientEvent('esx_winiarz:startTransform5', source)
end
			end)




RegisterServerEvent('esx_winiarz:startTransform6')
AddEventHandler('esx_winiarz:startTransform6', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)


		



			Citizen.Wait(10000)
			xPlayer.removeInventoryItem('miasz', 5)
			xPlayer.addInventoryItem('wino', 5)
			end)













RegisterServerEvent('esx_winiarz:stopHarvest')
AddEventHandler('esx_winiarz:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false

	end
end)

RegisterServerEvent('esx_winiarz:stopTransform')
AddEventHandler('esx_winiarz:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		
	else
		PlayersTransforming[_source]=true
		
	end
end)


	
	RegisterServerEvent('esx_winiarz:startSell')
	AddEventHandler('esx_winiarz:startSell', function(zone)
		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(source)
		local miasz = xPlayer.getInventoryItem('miasz').count
		local wino = xPlayer.getInventoryItem('wino').count
	
			
		if wino < 5 then
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Nie posiadasz wystarczajaco wina',
				type = "error",
				timeout = 3000,
				layout = "centerLeft"
			})
		return
		end
	
			PlayersHarvesting[_source]=true
				TriggerClientEvent('esx_winiarz:startSell2', source)
				end)
	
	
	
	
	RegisterServerEvent('esx_winiarz:startSell3')
	AddEventHandler('esx_winiarz:startSell3', function(zone)
		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(source)
		
				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_winiarz', function(account)
					societyAccount = account
				end)
	
				Citizen.Wait(10000)
				xPlayer.removeInventoryItem('wino', 5)
				xPlayer.addMoney(900)
				Citizen.Wait(1000)
				end)