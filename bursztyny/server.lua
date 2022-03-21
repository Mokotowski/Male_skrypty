ESX 						   = nil


local cena = 750 -- Ile dostajesz za 1 bursztyna 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('szukb') 
AddEventHandler('szukb', function(stan)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)


	xPlayer.addInventoryItem('bursztyn', stan)
end)
RegisterServerEvent('sharley_bursztyny:oplukserver') 
AddEventHandler('sharley_bursztyny:oplukserver', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bursztyny = xPlayer.getInventoryItem("bursztyn")
	local ilosc = bursztyny.count

	if ilosc > 0 then
	TriggerClientEvent('esx:showNotification', _source, 'Umyłeś ~g~'..ilosc..'~w~ bursztynów')
	xPlayer.removeInventoryItem('bursztyn', ilosc)
	xPlayer.addInventoryItem('ubursztyn', ilosc)
	elseif ilosc == 0 then
	TriggerClientEvent('esx:showNotification', source, '~r~Nie masz bursztynów do umycia!')
	end
end)

RegisterServerEvent('sharley_bursztyny:oszlifserver') 
AddEventHandler('sharley_bursztyny:oszlifserver', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bursztyny = xPlayer.getInventoryItem("ubursztyn")
	local ilosc = bursztyny.count

	if ilosc > 0 then
	TriggerClientEvent('esx:showNotification', _source, 'Oszlifowałeś ~g~'..ilosc..'~w~ bursztynów')
	xPlayer.removeInventoryItem('ubursztyn', ilosc)
	xPlayer.addInventoryItem('obursztyn', ilosc)
	elseif ilosc == 0 then
	TriggerClientEvent('esx:showNotification', source, '~r~Nie masz bursztynów do oszlifowania!')
	end
end)


RegisterServerEvent('sharley_bursztyny:sprzedajserver') 
AddEventHandler('sharley_bursztyny:sprzedajserver', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bursztyny = xPlayer.getInventoryItem("obursztyn")
	local ilosc = bursztyny.count
	local wcena = 100 * ilosc

	if ilosc > 0 then
	TriggerClientEvent('esx:showNotification', _source, 'Sprzedałeś ~g~'..ilosc..'~w~ oszlifowanych bursztynów za ~y~'..wcena..'$')
	xPlayer.removeInventoryItem('obursztyn', ilosc)
	xPlayer.addMoney(wcena)
	elseif ilosc == 0 then
	TriggerClientEvent('esx:showNotification', source, '~r~Nie masz oszlifowanych bursztynów na sprzedaż!')
	end
end)