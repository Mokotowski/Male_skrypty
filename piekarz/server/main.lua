
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local chleb = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'piekarz', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'piekarz', 'piekarz', 'society_piekarz', 'society_piekarz', 'society_piekarz', {type = 'public'})

RegisterServerEvent('esx_piekarz:startHarvest')
AddEventHandler('esx_piekarz:startHarvest', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pszenica').count
	
	if itemQuantity == 40 or itemQuantity > 40 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz już miejsca w torbie na pszenicę',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
	return
	end
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_piekarz:startHarvest2', source)
			end)




RegisterServerEvent('esx_piekarz:startHarvest3')
AddEventHandler('esx_piekarz:startHarvest3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pszenica').count
	
			Citizen.Wait(10000)
			xPlayer.addInventoryItem('pszenica', 5)
	end)



RegisterServerEvent('esx_piekarz:startTransform2')
AddEventHandler('esx_piekarz:startTransform2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pszenica = xPlayer.getInventoryItem('pszenica').count
	local maka = xPlayer.getInventoryItem('maka').count
		
		
	if pszenica < 10 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz niewystarczającą ilość pszenicy',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	elseif maka == 100 or maka > 100 then

		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz za duzo maki przy sobie',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	return
	else

		PlayersHarvesting[_source]=true
			TriggerClientEvent('esx_piekarz:startTransform3', source)
end
			end)
	
			


RegisterServerEvent('esx_piekarz:startTransform4')
AddEventHandler('esx_piekarz:startTransform4', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

		
	
			Citizen.Wait(10000)
			xPlayer.removeInventoryItem('pszenica', 10)
			xPlayer.addInventoryItem('maka', 20)
	end)

RegisterServerEvent('esx_piekarz:startTransform5')
AddEventHandler('esx_piekarz:startTransform5', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local maka = xPlayer.getInventoryItem('maka').count
	local breadfresh1 = xPlayer.getInventoryItem('breadfresh').count

		
	if maka < 20 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz niewystarczającą ilość mąki w torbie lub masz już świeży chleb',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})

	elseif breadfresh1 == 20 or breadfresh1 > 20 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Posiadasz za duzo chleba przy sobie',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})


	return
	else

		PlayersHarvesting[_source]=true
		    TriggerClientEvent('esx_piekarz:startTransform6', source)
			end
			end)

RegisterServerEvent('esx_piekarz:startTransform7')
AddEventHandler('esx_piekarz:startTransform7', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

		

			Citizen.Wait(10000)
			xPlayer.removeInventoryItem('maka', 20)
			xPlayer.addInventoryItem('breadfresh', 5)
			end)

RegisterServerEvent('esx_piekarz:stopHarvest')
AddEventHandler('esx_piekarz:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false

	end
end)

RegisterServerEvent('esx_piekarz:stopTransform')
AddEventHandler('esx_piekarz:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		
	else
		PlayersTransforming[_source]=true
		
	end
end)


	RegisterServerEvent('esx_piekarz:startSell')
	AddEventHandler('esx_piekarz:startSell', function(zone)
		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(source)
		local maka = xPlayer.getInventoryItem('maka').count
		local breadfresh1 = xPlayer.getInventoryItem('breadfresh').count
		
	if breadfresh1 < 5	 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Masz niewystarczającą ilość mąki w torbie lub masz już świeży chleb',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})



	return
		end

		
				PlayersHarvesting[_source]=true
				TriggerClientEvent('esx_piekarz:startSell2', source)

		end)


		RegisterServerEvent('esx_piekarz:startSell3')
	AddEventHandler('esx_piekarz:startSell3', function(zone)
		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(source)

		


		
				Citizen.Wait(10000)
				xPlayer.removeInventoryItem('breadfresh', 5)
				xPlayer.addMoney(800)

		end)