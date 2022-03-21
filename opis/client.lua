ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local opisy = {}

local displayOpisHeight = -0.1
local playerOpisDist = 20

local showPlayerBlips = false
local ignorePlayerNameDistance = false
local playerNamesDist = 15
local displayIDHeight = 1.2 --Height of player above players head(starts at center body mass)
--Set Default Values for Colors

local red = 255
local green = 255
local blue = 255
local WidoczneID = false

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov*1.5

    if onScreen then
        SetTextScale(0.0*scale, 0.9*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(3, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

function DrawText3DOpis(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov*0.6

    if onScreen then
        SetTextScale(0.0*scale, 0.40*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
     --   SetTextDropshadow(3, 0, 0, 0, 255)
     --   SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

RegisterNetEvent('route68:opis')
AddEventHandler('route68:opis', function(player, opis)
    local info = opis
    local ajdi = player
    opisy[ajdi] = info
end)

RegisterNetEvent('route68ID:distance')
AddEventHandler('route68ID:distance', function(bool)
    ignorePlayerNameDistance = bool
end)

RegisterNetEvent('route68:opisInnychGraczy')
AddEventHandler('route68:opisInnychGraczy', function()
    local AjDi = GetPlayerServerId(PlayerId())
    local MojOpis = opisy[AjDi]
    TriggerServerEvent('route68:opisInnychGraczyServer', AjDi, MojOpis)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        for _, player in ipairs(GetActivePlayers()) do
            N_0x31698aa80e0223f8(player)
        end
        for _, player2 in ipairs(GetActivePlayers()) do
            local ajdi = GetPlayerServerId(player2)
            if (opisy[ajdi] ~= nil and tostring(opisy[ajdi]) ~= '') then

                ped = GetPlayerPed( player2 )
                blip = GetBlipFromEntity( ped )

                xx1, yy1, zz1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                xx2, yy2, zz2 = table.unpack( GetEntityCoords( GetPlayerPed( player2 ), true ) )
                distance2 = math.floor(GetDistanceBetweenCoords(xx1,  yy1,  zz1,  xx2,  yy2,  zz2,  true))

                if ((distance2 < playerOpisDist)) then
					red = 230
					green = 255
                    blue = 255
                    local tekst = tostring(opisy[ajdi])
                    local words = {}
                    for word in tekst:gmatch("%w+") do table.insert(words, word) end
                    if #tekst > 40 then
                        local part1 = ''
                        local part2 = ''
                        local srodek = math.floor(#words * 0.5)
                        local srodek2 = srodek + 1
                        for i=1, srodek do
                            part1 = part1..words[i]..' '
                        end
                        for i=srodek+1, #words do
                            if i ~= #words then
                                part2 = part2..words[i]..' '
                            elseif i ==  #words then
                                part2 = part2..words[i]
                            end
                        end
                        --part2 = part2.gsub(" ))", "))")
                        DrawText3DOpis(xx2, yy2, zz2 + displayOpisHeight, ''..part1..'~n~'..part2..'')
                    else
                        DrawText3DOpis(xx2, yy2, zz2 + displayOpisHeight, tekst)
                    end
                end

            end
        end
    end
end)

