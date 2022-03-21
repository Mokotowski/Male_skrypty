
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('handlarz', function(source, rawCommand)

	TriggerClientEvent("tostweapon:AccesGranted",source)
	Wait(200)
	
end)

RegisterServerEvent("tostweapon:buyWeapon")
AddEventHandler("tostweapon:buyWeapon", function(hash,cena,nazwa)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local BlackHajs = 0
	BlackHajs = xPlayer.getAccount('black_money').money
	
	if BlackHajs >= cena then
	xPlayer.removeAccountMoney('black_money', cena)
	TriggerClientEvent('esx:showNotification', _source, '~g~Zapłaciłeś ~y~'..cena..'$~g~ za ~y~'..nazwa)
	TriggerClientEvent("tostweapon:ZakupionoDaj", _source, hash)
	else
	TriggerClientEvent('esx:showNotification', _source, '~y~Nie masz tyle brudnego siana, potrzebujesz ~r~'..cena..'$')
	end
	
end)