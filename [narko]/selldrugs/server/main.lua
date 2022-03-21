ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local xDrug = 0

RandomValue = function()
	local percent = math.random(1, 100)
	local x = 0
	if percent >= 1 and percent <= 40 then
		x = 1
	elseif percent >= 41 and percent <= 65 then
		x = 2
	elseif percent >= 66 and percent <= 85 then
		x = 3
	elseif percent >= 86 and percent <= 95 then
		x = 4
	else
		x = 5
	end
	-- 5sz - 5%  ;  4sz - 10%  ;  3sz - 20%  ; 2sz - 25%  ;  1sz - 40%
	return x
end


ESX.RegisterServerCallback('mk_selldrugs:checkDrugs', function(source, cb, LSPD)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	local weedslaba = xPlayer.getInventoryItem('packagedweedslaba').count
	local methslaba = xPlayer.getInventoryItem('packagedmethmslaba').count
	local cokeslaba = xPlayer.getInventoryItem('packagedcocaslaba').count
	local weedsrednia = xPlayer.getInventoryItem('packagedweedsrednia').count
	local methsrednia = xPlayer.getInventoryItem('packagedmethsrednia').count
	local cokesrednia = xPlayer.getInventoryItem('packagedcocasrednia').count
	local weedmocna = xPlayer.getInventoryItem('packagedweedmocna').count
	local methmocna = xPlayer.getInventoryItem('packagedmethmocna').count
	local cokemocna = xPlayer.getInventoryItem('packagedcocamocna').count


	if weedslaba > 3 then
		if LSPD >= Config.CopsForWeed then
			cb(1)
		else
			cb(2)
		end
	elseif methslaba > 3 then
		if LSPD >= Config.CopsForMeth then
			cb(1)
		else
			cb(2)
		end
	elseif cokeslaba > 3 then
		if LSPD >= Config.CopsForCoke then
			cb(1)
		else
			cb(2)
		end
	elseif weedsrednia > 3 then
		if LSPD >= Config.CopsForWeed then
			cb(1)
		else
			cb(2)
		end
	elseif methsrednia > 3 then
		if LSPD >= Config.CopsForMeth then
			cb(1)
		else
			cb(2)
		end
	elseif cokesrednia > 3 then
		if LSPD >= Config.CopsForCoke then
			cb(1)
		else
			cb(2)
		end
	elseif weedmocna > 3 then
		if LSPD >= Config.CopsForWeed then
			cb(1)
		else
			cb(2)
		end
	elseif methmocna > 3 then
		if LSPD >= Config.CopsForMeth then
			cb(1)
		else
			cb(2)
		end
	elseif cokemocna > 3 then
		if LSPD >= Config.CopsForCoke then
			cb(1)
		else
			cb(2)
		end
	else
		cb(3)
	end
end)



RegisterServerEvent('mk_selldrugs:sell')
AddEventHandler('mk_selldrugs:sell', function(LSPD)
	local xPlayer = ESX.GetPlayerFromId(source)	
	xDrug = 0
	local weedslabaPrice = 500
	local methslabaPrice = 550
	local cokeslabaPrice = 900
	local weedsredniaPrice = 1000
	local methsredniaPrice = 1150
	local cokesredniaPrice = 1400
	local weedmocnaPrice = 1500
	local methmocnaPrice = 1650
	local cokemocnaPrice = 1800

	local weedslaba = xPlayer.getInventoryItem('packagedweedslaba').count
	local methslaba = xPlayer.getInventoryItem('packagedmethmslaba').count
	local cokeslaba = xPlayer.getInventoryItem('packagedcocaslaba').count
	local weedsrednia = xPlayer.getInventoryItem('packagedweedsrednia').count
	local methsrednia = xPlayer.getInventoryItem('packagedmethsrednia').count
	local cokesrednia = xPlayer.getInventoryItem('packagedcocasrednia').count
	local weedmocna = xPlayer.getInventoryItem('packagedweedmocna').count
	local methmocna = xPlayer.getInventoryItem('packagedmethmocna').count
	local cokemocna = xPlayer.getInventoryItem('packagedcocamocna').count


	local drugName = ''
	local drugType 
	local hajs = 0
	xDrug = RandomValue()
	if weedslaba >= 1 then
		drugType = 'packagedweedslaba'
		if weedslaba > 0 and weedslaba <= 1 then
			xDrug = 1
		elseif weedslaba == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weedslaba == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weedslaba == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif weedsrednia >= 1 then
		drugType = 'packagedweedsrednia'
		if weedsrednia > 0 and weedsrednia <= 1 then
			xDrug = 1
		elseif weedsrednia == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weedsrednia == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weedsrednia == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif weedmocna >= 1 then
		drugType = 'packagedweedmocna'
		if weedmocna > 0 and weedmocna <= 1 then
			xDrug = 1
		elseif weedmocna == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weedmocna == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weedmocna == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif methslaba >= 1 then
		drugType = 'packagedmethmslaba'
		if methslaba > 0 and methslaba <= 1 then
			xDrug = 1
		elseif methslaba == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif methslaba == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif methslaba == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif methsrednia >= 1 then
		drugType = 'packagedmethmsrednia'
		if methsrednia > 0 and methsrednia <= 1 then
			xDrug = 1
		elseif methsrednia == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif methsrednia == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif methsrednia == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif methmocna >= 1 then
		drugType = 'packagedmethmocna'
		if methmocna > 0 and methmocna <= 1 then
			xDrug = 1
		elseif methmocna == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif methmocna == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif methmocna == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif cokeslaba >= 1 then
		drugType = 'packagedcocaslaba'
		if cokeslaba > 0 and cokeslaba <= 1 then
			xDrug = 1
		elseif cokeslaba == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif cokeslaba == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif cokeslaba == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif cokesrednia >= 1 then
		drugType = 'packagedcocasrednia'
		if cokesrednia > 0 and cokesrednia <= 1 then
			xDrug = 1
		elseif cokesrednia == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif cokesrednia == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif cokesrednia == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif cokemocna >= 1 then
		drugType = 'packagedcocamocna'
		if cokemocna > 0 and cokemocna <= 1 then
			xDrug = 1
		elseif cokemocna == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif cokemocna == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif cokemocna == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	end
local mnoznik 

	if LSPD == 0 then
		mnoznik = 0.2
	elseif LSPD == 1 then
		mnoznik = 0.5
	elseif LSPD == 2 then
		mnoznik = 0.7
	elseif LSPD == 3 then
		mnoznik = 1.0
	elseif LSPD == 4 then
		mnoznik = 1.2
	elseif LSPD == 5 then
		mnoznik = 1.4
	elseif LSPD == 6 then
		mnoznik = 1.6
	elseif LSPD == 7 then
		mnoznik = 1.8
	elseif LSPD == 8 then
		mnoznik = 2.0
	elseif LSPD >= 10 then
		mnoznik = 2.5
	end

	local weedslabaPrice = 500
	local methslabaPrice = 550
	local cokeslabaPrice = 900
	local weedsredniaPrice = 1000
	local methsredniaPrice = 1150
	local cokesredniaPrice = 1400
	local weedmocnaPrice = 1500
	local methmocnaPrice = 1650
	local cokemocnaPrice = 1800


	if drugType=='packagedweedslaba' then
		hajs = math.floor(weedslabaPrice * xDrug * mnoznik)
	drugName = 'marihuany'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedweedsrednia' then
		hajs = math.floor(weedsredniaPrice * xDrug * mnoznik)
	drugName = 'marihuany'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedweedmocna' then
		hajs = math.floor(weedmocnaPrice * xDrug * mnoznik)
	drugName = 'marihuany'
			xPlayer.addMoney(hajs)

	elseif drugType=='packagedmethmslaba' then
		hajs = math.floor(methslabaPrice * xDrug * mnoznik)
	drugName = 'metamfetaminy'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedmethsrednia' then
		hajs = math.floor(methsredniaPrice * xDrug * mnoznik)
	drugName = 'metamfetaminy'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedmethmocna' then
		hajs = math.floor(methmocnaPrice * xDrug * mnoznik)
	drugName = 'metamfetaminy'
			xPlayer.addMoney(hajs)

	elseif drugType=='packagedcocaslaba' then
		hajs = math.floor(cokeslabaPrice * xDrug * mnoznik)
	drugName = 'kokainy'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedcocasrednia' then
		hajs = math.floor(cokesredniaPrice * xDrug * mnoznik)
	drugName = 'kokainy'
			xPlayer.addMoney(hajs)
	elseif drugType=='packagedcocamocna' then
		hajs = math.floor(cokemocnaPrice * xDrug * mnoznik)
	drugName = 'kokainy'
	xPlayer.addMoney(hajs)
end


	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, xDrug)
		if drugType == 'packagedweed' then
			xPlayer.addMoney(hajs)
		end
		
		TriggerClientEvent('mk_selldrugs:stopSell', xPlayer.source, 1, ('~o~'.. xDrug ..' w ilośći '.. drugName..' za ' .. hajs .. "$" ))
		TriggerEvent('top_discord:send', source, 'https://discordapp.com/api/webhooks/922794598848417884/YNGHhGsRf7npRju1rUj8Eg9pEov_WajH1phQbVWjMFZV6GRTDXmGdmvYJiv0TPy5R1UR', 'Sprzedał '.. drugType ..'w ilośći '.. xDrug..' za: $' ..hajs)
	end
end)


RegisterServerEvent('mk_selldrugs:triggerDispatch')
AddEventHandler('mk_selldrugs:triggerDispatch', function(pos, street, photo)
	local xPlayers = ESX.GetPlayers()

	local msg = ("^r[^310-72^7] ^6^*Zgłoszenie sprzedaży narkotyków. Ulica: ^7^_"..street)
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if (xPlayer.job.name == 'police') then
			if photo then
				TriggerClientEvent('notifyc', xPlayer.source, tonumber(source))
			end
			TriggerClientEvent('mk_selldrugs:showNotify', xPlayer.source, pos, street, msg)
		end
	end
end)
