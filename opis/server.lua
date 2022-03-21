ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']

		}
	else
		return nil
	end
end

TriggerEvent('es:addGroupCommand', 'opis', 'user', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local name = getIdentity(source)
	local realName = name.firstname .. " " .. name.lastname
    if args[1] ~= nil then
        local text = table.concat(args, " ",1)
        if #text > 91 then
            TriggerClientEvent('pNotify:SendNotification', source, {text = "Maksymalna długość opisu to 91 znaków!"})
        else
            TriggerClientEvent('route68:opis', -1, source, ''..text..' ')
            sendToDiscordkomendaopis('Mokotowki - Chat','[OPIS] [' .. source .. '] ' .. realName .. ' | ' .. GetPlayerName(source) .. ' Hex: ' .. GetPlayerIdentifier(source) .. ' : ' .. text .. ' ', 1876210)
        end
	else
		TriggerClientEvent('route68:opis', -1, source, '')
	end
end, function(source, args, user)
end)

RegisterServerEvent('route68:opisInnychGraczyServer')
AddEventHandler('route68:opisInnychGraczyServer', function(id, opis)
    TriggerClientEvent('route68:opis', -1, id, opis)
end)

function sendToDiscordkomendaopis (name,message,color)
	local DiscordWebHook = 'https://discordapp.com/api/webhooks/935818000685219871/nMSfk9sztphA_-rwXLteEyuEOrxF40nT1_h-IyteO54KvOFtGzcVctpyUO-w9eOD31wv'
	local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')

  local embeds = {
	{
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "Wysłano o: " ..date.."",
		 },
	}
}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end