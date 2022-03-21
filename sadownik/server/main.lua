

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local sok = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'sadownik', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'sadownik', 'sadownik', 'society_sadownik', 'society_sadownik', 'society_sadownik', {type = 'public'})

RegisterServerEvent('esx_sadownik:startHarvest')
AddEventHandler('esx_sadownik:startHarvest', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('jablka').count

	if itemQuantity == 20 or itemQuantity > 20 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz juz miejsca w torbie na jablka',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
	return
	end

		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_sadownik_startHarvestCompleteJablka', source)
		end)



RegisterServerEvent('esx_sadownik_startHarvestCompleteJablka2')
AddEventHandler('esx_sadownik_startHarvestCompleteJablka2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('jablka').count

  
		Citizen.Wait(10000)
		xPlayer.addInventoryItem('jablka', 5)
		end)

RegisterServerEvent('esx_sadownik:startHarvest2')
AddEventHandler('esx_sadownik:startHarvest2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pomarancza').count

	if itemQuantity == 20 or itemQuantity > 20 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz juz miejsca w torbie na pomarancze',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
	return
end

		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_sadownik_startHarvestCompleteJablka3', source)
		end)


RegisterServerEvent('esx_sadownik_startHarvestCompleteJablka4')
AddEventHandler('esx_sadownik_startHarvestCompleteJablka4', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pomarancza').count
		
		
		
		Citizen.Wait(10000)
		xPlayer.addInventoryItem('pomarancza', 5)
		end)

RegisterServerEvent('esx_sadownik:stopHarvest')
AddEventHandler('esx_sadownik:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false

	end
end)



--or sok2 == 40 or sok2 > 40
-- pomarancza < 5
RegisterServerEvent('esx_sadownik:startTransform')
AddEventHandler('esx_sadownik:startTransform', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pomarancza = xPlayer.getInventoryItem('pomarancza').count
	local jablka = xPlayer.getInventoryItem('jablka').count
	local sok2 = xPlayer.getInventoryItem('sok').count

	if jablka < 5 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie posiadasz wystarczajacej ilosci jablek',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
		})
	elseif pomarancza < 5 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie posiadasz wystarczajacej ilosci pomaranczy',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
		})
	
	elseif sok2 == 40 or sok2 > 40 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Posiadasz za duzo soku przy sobie',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
		})
		
	return
	else

		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_sadownik_zbieraniestart1', source)
	end
		end)	


RegisterServerEvent('esx_sadownik:startTransform2')
AddEventHandler('esx_sadownik:startTransform2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pomarancza = xPlayer.getInventoryItem('pomarancza').count
	local jablka = xPlayer.getInventoryItem('jablka').count
	local sok2 = xPlayer.getInventoryItem('sok').count
		
		

	
		Citizen.Wait(10000)
		xPlayer.removeInventoryItem('jablka', 5)
		xPlayer.removeInventoryItem('pomarancza', 5)
		xPlayer.addInventoryItem('sok', 10)
		end)

RegisterServerEvent('esx_sadownik:stopHarvest')
AddEventHandler('esx_sadownik:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false

	end
end)

RegisterServerEvent('esx_sadownik:stopTransform')
AddEventHandler('esx_sadownik:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		
	else
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('sok').count < 40 then
				sok = 0
			else
				sok = 1
			end
			

		
			if sok == 0 then
				TriggerClientEvent('esx:showNotification', source, '~y~Masz ~r~niewystarczaj�c� ~y~ilo�� sok�w do sprzedania!')
				return
			else

				if (sok == 1) then
					SetTimeout(20000, function()
						xPlayer.removeInventoryItem('sok', 2)
						xPlayer.addMoney('1000') --pieni�dze za jaki sprzedajemy sok x5
						Sell(source,zone)

						end)

					end
				end
				
			end
		end
	end
	



RegisterServerEvent('esx_sadownik:startSell')
AddEventHandler('esx_sadownik:startSell', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('sok').count

	if itemQuantity < 2  then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie posiadasz soku do sprzedania',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
	return
	end

		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_sadownik:startSell2', source)
		end)


RegisterServerEvent('esx_sadownik:startSell3')
AddEventHandler('esx_sadownik:startSell3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_sadownik', function(account)
			societyAccount = account
		end)
				
		Citizen.Wait(10000)
		xPlayer.removeInventoryItem('sok', 2)
		xPlayer.addMoney('120') --pieni�dze za jaki sprzedajemy sok x5
		Citizen.Wait(1000)
		end)






RegisterServerEvent('esx_sadownik:stopSell')
AddEventHandler('esx_sadownik:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		
	else
		PlayersSelling[_source]=true
	end

end)