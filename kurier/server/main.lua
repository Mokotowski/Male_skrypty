	
ESX = nil
local PlayersSelling = {}
local PlayersHarvesting = {}
local karta = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'kurier', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'kurier', 'kurier', 'society_kurier', 'society_kurier', 'society_kurier', {type = 'public'})






RegisterServerEvent('esx_kurier:startHarvest')
AddEventHandler('esx_kurier:startHarvest', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('medic').count	
	
	if itemQuantity == 40 or itemQuantity > 31 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Nie masz już miejsca w torbie na przedmioty medyczne',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})
	return
	end
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_kurier:StartHarvestMedic1', source)
	end)
	
	
	
	
	
			
RegisterServerEvent('esx_kurier:StartHarvestMedic2')
AddEventHandler('esx_kurier:StartHarvestMedic2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)	
	

	Citizen.Wait(10000)
	xPlayer.addInventoryItem('medic', 10)
end)






RegisterServerEvent('esx_kurier:startHarvest2')
AddEventHandler('esx_kurier:startHarvest2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('medic').count
	local itemQuantity2 = xPlayer.getInventoryItem('kartaems').count

	if itemQuantity < 10 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Masz niewystrczająco przedmiotów medycznych w torbie',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })

	elseif itemQuantity2 == 4 or itemQuantity2 > 4 then

		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Posiadasz za duzo kart EMS przy sobie',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })

	return
	else
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_kurier:startHarvestMedic3', source)
	end
	end)
	
	
	
	
	
	
	
RegisterServerEvent('esx_kurier:StartHarvestMedic4')
AddEventHandler('esx_kurier:StartHarvestMedic4', function(zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	
	Citizen.Wait(10000)
	xPlayer.removeInventoryItem('medic', 10)
	xPlayer.addInventoryItem('kartaems', 1)
	
	end)
	
	
	
	
	
			
RegisterServerEvent('esx_kurier:startHarvest3')
AddEventHandler('esx_kurier:startHarvest3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('ubranialspd').count
	
	if itemQuantity == 40 or itemQuantity > 31 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz już miejsca w torbie na ubrania wiezienne',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })
			
	
	
	return
	end
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_kurier:startHarvestLSPD1', source) 
		
	end)
	
	
	
	
	
	
RegisterServerEvent('esx_kurier:startHarvestLSPD2')
AddEventHandler('esx_kurier:startHarvestLSPD2', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	Citizen.Wait(10000)
	xPlayer.addInventoryItem('ubranialspd', 10)
	
	end)
	
	
	
	
	
			
RegisterServerEvent('esx_kurier:startHarvest4')
AddEventHandler('esx_kurier:startHarvest4', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity2 = xPlayer.getInventoryItem('ubranialspd').count
	local itemQuantity = xPlayer.getInventoryItem('kartalspd').count

	
	if itemQuantity2 < 9 then
		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nie masz ubran więziennych',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })

	elseif itemQuantity == 4 or itemQuantity > 4 then

		TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Posiadasz za duzo kart LSPD przy sobie',
            type = "error",
            timeout = 3000,
            layout = "centerLeft"
        })

	return
	else
	
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx_kurier:startHarvestLSPD3', source)

		end
	end)
			
RegisterServerEvent('esx_kurier:startHarvestLSPD4')
AddEventHandler('esx_kurier:startHarvestLSPD4', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity2 = xPlayer.getInventoryItem('ubranialspd').count
	
			Citizen.Wait(10000)
			xPlayer.removeInventoryItem('ubranialspd', 10)
			xPlayer.addInventoryItem('kartalspd', 1)
			end)			
			
			
			

RegisterServerEvent('esx_kurier:stopHarvest')
AddEventHandler('esx_kurier:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false

	end
end)


	
	
RegisterServerEvent('esx_kurier:startSell')
AddEventHandler('esx_kurier:startSell', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local kartaems = xPlayer.getInventoryItem('kartaems').count	
	local kartalspd = xPlayer.getInventoryItem('kartalspd'). count
	
	if kartalspd == 1 or kartalspd > 1 then
		TriggerClientEvent('esx_kurier:sellkartalspd', source)
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Trwa sprzedawanie karty LSPD',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})
	elseif kartaems == 1 or kartaems > 1 then
	   TriggerClientEvent('esx_kurier:sellkartaems', source)
	   		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = 'Trwa sprzedawanie karty Medycznej',
			type = "error",
			timeout = 3000,
			layout = "centerLeft"
		})
	end
	end)
	
RegisterServerEvent('esx_kurier:sellkartalspd2')
AddEventHandler('esx_kurier:sellkartalspd2', function(zone)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	
	Citizen.Wait(4000)
	xPlayer.removeInventoryItem('kartalspd', 1)
	xPlayer.addMoney(900)

end)

RegisterServerEvent('esx_kurier:sellkartaems2')
AddEventHandler('esx_kurier:sellkartaems2', function(zone)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	
	Citizen.Wait(4000)
	xPlayer.removeInventoryItem('kartaems', 1)
	xPlayer.addMoney(900)

end)

RegisterServerEvent('esx_kurier:stopSell')
AddEventHandler('esx_kurier:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		
	else
		PlayersSelling[_source]=true
	end

end)