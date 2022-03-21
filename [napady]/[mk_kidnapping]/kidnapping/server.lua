ESX = nil
local lastNapping = 0
local queryRoom = false

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

ESX.RegisterServerCallback('kidnapping:server:checkQueryRoom', function(source, cb)
    cb(queryRoom)
end)

RegisterServerEvent('kidnapping:server:syncQueryRoom')
AddEventHandler('kidnapping:server:syncQueryRoom', function()
    queryRoom = not queryRoom
end)

ESX.RegisterServerCallback('kidnapping:server:checkTime', function(source, cb)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastNapping) < Config['Kidnapping']['nextNapping'] and lastNapping ~= 0 then
        local seconds = Config['Kidnapping']['nextNapping'] - (os.time() - lastNapping)
        player.showNotification(Strings['wait_nextnapping'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
        cb(false)
    else
        lastNapping = os.time()
        cb(true)
    end
end)

RegisterNetEvent('kidnapping:server:policeAlert')
AddEventHandler('kidnapping:server:policeAlert', function(coords)
    local players = ESX.GetPlayers()
    
    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            TriggerClientEvent('kidnapping:client:policeAlert', players[i], coords)
        end
    end
end)

RegisterServerEvent('kidnapping:server:giveVideoRecord')
AddEventHandler('kidnapping:server:giveVideoRecord', function()
    local src = source
    local player = ESX.GetPlayerFromId(src)

    if player then
        player.addInventoryItem(Config['Kidnapping']['videoRecordItem'], 1)
    end
end)

RegisterServerEvent('kidnapping:server:finish')
AddEventHandler('kidnapping:server:finish', function()
    local src = source
    local player = ESX.GetPlayerFromId(src)

    if player then
        local count = player.getInventoryItem(Config['Kidnapping']['videoRecordItem']).count
        if count > 0 then -- Crash, drop, etc. that may occur after taking a video recording in the previous job. I make him sell all the video recordings on it for situations like.
            player.removeInventoryItem(Config['Kidnapping']['videoRecordItem'], count)
            player.addMoney(count * Config['Kidnapping']['rewardCash'])
        end
        local random = math.random(1, #Config['Kidnapping']['randomRewardItems'])
        local item = Config['Kidnapping']['randomRewardItems'][random]
        player.addInventoryItem(item, 1)
    end
end)

