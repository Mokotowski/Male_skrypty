ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('fivem_propcheck')
AddEventHandler('fivem_propcheck', function()
	DropPlayer(source, 'Posiadasz usunięte propy | Napraw to i wchodź na serwer')
end)



RegisterNetEvent("mokotowski:Logs")
AddEventHandler("mokotowski:Logs", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nam = xPlayer.getName()
    local dis = xPlayer.getIdentifier()
    sendDiscord('**[Gracz]:** ' ..nam.. '\n**[Steam]:** ' ..dis..'')
end)
function sendDiscord(message)
	local content = {
        {
        	["color"] = '5015295',
            ["title"] = "CHCIAŁ WBIĆ BEZ PROPÓW",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Moktowski - PROPY LOGS ",
            },
        }
    }
  	PerformHttpRequest("https://discordapp.com/api/webhooks/935818112304042004/kKih_eyuZHPhwq5Bh-gvW88ams2eZFRPxwKMswSqXNP5J1DBCDaYcg2avRxfxrEJOoSY", function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end