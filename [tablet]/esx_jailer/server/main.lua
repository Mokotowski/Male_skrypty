ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

TriggerEvent('es:addGroupCommand', 'jail', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil and args[2] and args[3] and args[4] then
		TriggerEvent('esx_jailer:sendToJail', tonumber(args[1]), tonumber(args[2] * 60), tostring(args[3]), tonumber(args[4]))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Prawidlowe użycie: /jail ID CZAS POWOD GRZYWNA")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Put a player in jail", params = {{name = "id", help = "target id"}, {name = "time", help = "jail time in minutes"}}})

TriggerEvent('es:addGroupCommand', 'unjail', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil then
		TriggerEvent('esx_jailer:unjailQuest', tonumber(args[1]))
	else
		TriggerEvent('esx_jailer:unjailQuest', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Unjail people from jail", params = {{name = "id", help = "target id"}}})

RegisterServerEvent('esx_jailer:sendToJail')
AddEventHandler('esx_jailer:sendToJail', function(source, jailTime, jailReason, jailGrzywna, jailFP)

	local years = jailTime
	jailTime = jailTime * 60
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Sync.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		else
			MySQL.Async.execute("INSERT INTO jail (identifier,jail_time) VALUES (@identifier,@jail_time)", {['@identifier'] = identifier, ['@jail_time'] = jailTime})
		end
	end)
	local name = GetCharacterName(source)
	
	TriggerClientEvent('chat:addMessage', -1, {args = {_U('jail'), _U('jailed_msg', name, years, jailReason, jailGrzywna, jailFP)}, color = {0, 153, 204}})
	TriggerClientEvent('esx_jailer:jail', source, jailTime)
	TriggerClientEvent('esx_policejob:unrestrain', source)
end)

RegisterServerEvent('esx_jailer:checkJail')
AddEventHandler('esx_jailer:checkJail', function()
	local player = source
	local identifier = GetPlayerIdentifiers(player)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('esx_jailer:jail', player, tonumber(result[1].jail_time))
		end
	end)
end)


RegisterServerEvent('esx_jailer:unjailQuest')
AddEventHandler('esx_jailer:unjailQuest', function(source)
	if source ~= nil then
		unjail(source)
	end
end)


RegisterServerEvent('esx_jailer:unjailTime')
AddEventHandler('esx_jailer:unjailTime', function()
	unjail(source)
end)


RegisterServerEvent('esx_jailer:updateRemaining')
AddEventHandler('esx_jailer:updateRemaining', function(jailTime)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			MySQL.Sync.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		end
	end)
end)

function unjail(target)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			MySQL.Async.execute('DELETE from jail WHERE identifier = @id', {['@id'] = identifier})
			local name = GetCharacterName(target)
			TriggerClientEvent('chatMessage', -1, _U('judge'), { 147, 196, 109 }, _U('unjailed', name))
		end
	end)
	TriggerClientEvent('esx_jailer:unjail', target)
end

function round(x)
	return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function GetCharacterName(source)

	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil and result[1].lastname ~= nil then
		return result[1].firstname .. ' ' .. result[1].lastname
	else
		return GetPlayerName(source)
	end
end
