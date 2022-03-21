ESX = nil



TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('prx_dineronegro:lavarDinero')
AddEventHandler('prx_dineronegro:lavarDinero', function(amount)
	local _source = source
	local gosciu_hunchos = ESX.GetPlayerFromId(_source)
	
	local accountMoney = 0

	
	
	accountMoney = gosciu_hunchos.getAccount('black_money').money
	
		if accountMoney < amount then
			notification('Nie masz tylu brudnych pieniędzy')
			notification(_U('dont_have_money'))
			
		else
			gosciu_hunchos.removeAccountMoney('black_money', amount)
			gosciu_hunchos.addMoney(amount)
			notification('Wyprałeś: '..amount..'$ brudnych pieniędzy na : '..amount..'$ czystych')
			
			
			
		end
	
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end




