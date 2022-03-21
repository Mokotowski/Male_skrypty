ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterCommand("odznaka", function(source, args, rawcmd)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobname = xPlayer.job.name
    if jobname == 'police' then
        local grade = xPlayer.job.grade_label
        local dane = GetCharName(xPlayer.identifier)
        TriggerClientEvent("odznaka:pokaodznake", -1, source, { ranga=grade, dane=dane})
    end
end)





function GetCharName(identifier)
    local d = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    });
    d = d[1]
    return d.firstname.." "..d.lastname
end

function NadajOdznake(identifier, callsign, odznaka)
    local a = MySQL.Sync.fetchAll("SELECT * FROM odznaka WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    });
    a = a[1]
    if a == nil then
        MySQL.Async.execute("INSERT INTO odznaka (identifier, callsign, odznaka) VALUES (@identifier, @callsign, @odznaka)", {
            ['@identifier'] = identifier,
            ['@callsign'] = callsign,
            ['@odznaka'] = odznaka
        });
    else
        MySQL.Async.execute("UPDATE odznaka SET callsign=@callsign, odznaka=@odznaka WHERE identifier = @identifier", {
            ['@identifier'] = identifier,
            ['@callsign'] = callsign,
            ['@odznaka'] = odznaka
        });
    end
end