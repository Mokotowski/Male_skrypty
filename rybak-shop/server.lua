ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)







RegisterServerEvent('Rybak:folia')
AddEventHandler('Rybak:folia', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 175) then
		xPlayer.removeMoney(175)
		
		xPlayer.addInventoryItem('folia', 1)
		
		notification("Kupiłeś folie")
	else
		notification("Nie masz wystarczająco pieniędzy")
	end		
end)


RegisterServerEvent('Rybak:suwak')
AddEventHandler('Rybak:suwak', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 45) then
		xPlayer.removeMoney(45)
		
		xPlayer.addInventoryItem('suwak', 1)
		
		notification("Kupiłeś suwak")
	else
		notification("Nie masz wystarczająco pieniędzy")
	end		
end)

RegisterServerEvent('Rybak:wedka')
AddEventHandler('Rybak:wedka', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 100) then
		xPlayer.removeMoney(100)
		
		xPlayer.addInventoryItem('wedka', 1)
		
		notification("Kupiłeś wędke")
	else
		notification("Nie masz wystarczająco pieniędzy")
	end		
end)




RegisterServerEvent('Rybak:sacid')
AddEventHandler('Rybak:sacid', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 25) then
		xPlayer.removeMoney(25)
		
		xPlayer.addInventoryItem('sacid', 1)
		
		notification("Kupiłeś sód")
	else
		notification("Nie masz wystarczająco pieniędzy")
	end		
end)


RegisterServerEvent('Rybak:ammonia')
AddEventHandler('Rybak:ammonia', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 50) then
		xPlayer.removeMoney(50)
		
		xPlayer.addInventoryItem('ammonia', 1)
		
		notification("Kupiłeś amoniak")
	else
		notification("Nie masz wystarczająco pieniędzy")
	end		
end)




RegisterServerEvent('Rybak:malaryba')
AddEventHandler('Rybak:malaryba', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local koszulka = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "malaryba" then
			koszulka = item.count
		end
	end
    
    if koszulka > 0 then
        xPlayer.removeInventoryItem('malaryba', 1)
        xPlayer.addMoney(250)
		
    else 
        TriggerClientEvent('pNotify:SendNotification', xPlayer.source, {text = 'Nie masz tego przedmiotu w ekwipunku!', type = 'success', layout = 'centerRight'})
    end
end)

RegisterServerEvent('Rybak:ryba')
AddEventHandler('Rybak:ryba', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local koszulka = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "ryba" then
			koszulka = item.count
		end
	end
    
    if koszulka > 0 then
        xPlayer.removeInventoryItem('ryba', 1)
        xPlayer.addMoney(400)
		
    else 
        TriggerClientEvent('pNotify:SendNotification', xPlayer.source, {text = 'Nie masz tego przedmiotu w ekwipunku!', type = 'success', layout = 'centerRight'})
    end
end)

RegisterServerEvent('Rybak:duzaryba')
AddEventHandler('Rybak:duzaryba', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local koszulka = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "duzaryba" then
			koszulka = item.count
		end
	end
    
    if koszulka > 0 then
        xPlayer.removeInventoryItem('duzaryba', 1)
        xPlayer.addMoney(500)
		
    else 
        TriggerClientEvent('pNotify:SendNotification', xPlayer.source, {text = 'Nie masz tego przedmiotu w ekwipunku!', type = 'success', layout = 'centerRight'})
    end
end)












































function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end