local Config = {}
--SET TO TRUE IF YOU ARE USING B1G_HUD
Config.isbighud = true


local toghud = false
myhunger = nil
mythirst = nil
mystress = nil
local loaded = false

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
      Citizen.Wait(10)
    end
  end
)
RegisterCommand('hud', function(source, args, rawCommand)
    toghud = not toghud
    TriggerEvent('hud:toggleui', toghud)
    TriggerEvent('carhud', toghud)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	toghud = true
    showhud()
end)

RegisterNetEvent('hud:toggleui')
AddEventHandler('hud:toggleui', function(show)
    if show == true then
        toghud = true
        showhud()
    else
        toghud = false
    end
end)

function startUpdate()
    Citizen.CreateThread(function()
        while toghud do
            TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
                myhunger = hunger.getPercent()
            end)
            Citizen.Wait(1500)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                mythirst = thirst.getPercent()
            end)
            Citizen.Wait(1500)
            TriggerEvent('esx_status:getStatus','stress',function(stress)
                mystress = stress.getPercent()
            end)
            Citizen.Wait(1500)
        end
    end)
end

function showhud()
    local player = PlayerPedId()
    local health = (GetEntityHealth(player) - 100)
    local armor = GetPedArmour(player)
    local oxy = nil
    startUpdate()
    while toghud do
        Citizen.Wait(200)
        player = PlayerPedId()
        health = (GetEntityHealth(player) - 100)
        armor = GetPedArmour(player)
        if IsPedOnFoot(player) then
            if IsPedSwimmingUnderWater(player) then
                oxy = (GetPlayerUnderwaterTimeRemaining(PlayerId())*10)
                if oxy <= 0.0 and health >= 1 then
                    SetEntityHealth(player, 0)
                end
            else
                oxy = 100.0 - (GetPlayerSprintStaminaRemaining(PlayerId()))
            end
        else
            oxy = 0
        end
        if not IsPauseMenuActive() then
            SendNUIMessage({
                action = 'updateStatusHud',
                isCar = IsPedInAnyVehicle(player, false) and IsVehicleEngineOn(GetVehiclePedIsIn(player, false)) and Config.isbighud == true,
                show = toghud,
                health = health,
                armour = armor,
                oxygen = oxy,
                hunger = myhunger,
                thirst = mythirst,
                stress = mystress,
            })
        else
            SendNUIMessage({
                action = 'updateStatusHud',
                show = false,
            })
        end
    end
end
