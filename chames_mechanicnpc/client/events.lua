RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
    Heap.ESX.PlayerData = response
end)

RegisterNetEvent("james_mechanicnpc:updateRepairs")
AddEventHandler("james_mechanicnpc:updateRepairs", function(updatedRepairs)
    Heap.Mechanics = updatedRepairs
end)

RegisterNetEvent("james_mechanicnpc:repairDone")
AddEventHandler("james_mechanicnpc:repairDone", function(mechanicDone, repairData, notify)
    if not NetworkDoesNetworkIdExist(repairData.NetId) then return end

    local vehEntity = NetToVeh(repairData.NetId)

    FinishRepair(vehEntity)

    if notify then
        Heap.ESX.ShowNotification(mechanicDone .. ": Twoje auto zostało naprawione!")
    end
end)

RegisterNetEvent("james_mechanicnpc:updateSequence")
AddEventHandler("james_mechanicnpc:updateSequence", function(mechanicName, repairData, sequenceId)
    Trace("Sequence", mechanicName, repairData, sequenceId)

    if not NetworkDoesNetworkIdExist(repairData.NetId) then return end

    local vehEntity = NetToVeh(repairData.NetId)

    if DoesEntityExist(vehEntity) then
        Trace("Update sequence on:", mechanicName, "with handleId:", vehEntity)

        local ped = GetPedHandleWithName(mechanicName)

        if not ped then return end

        RepairSequence(sequenceId, vehEntity, ped.Handle, repairData)
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for _, pedData in pairs(Heap.Peds) do
            if DoesEntityExist(pedData.Handle) then
                DeleteEntity(pedData.Handle)
            end
        end
    end
end)