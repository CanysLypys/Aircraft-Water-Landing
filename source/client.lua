Citizen.CreateThread(function()

    local ped = GetPlayerPed(-1)

    while true do
        Citizen.Wait(0)
        if IsPedInAnyPlane(ped) then
            vehicle = GetVehiclePedIsIn(ped, false)
            if IsEntityInWater(vehicle) then

                SetVehicleEngineHealth(vehicle, 0.0)
                Wait(500)

                local ModelHash = `DINGHY`
                if not IsModelInCdimage(ModelHash) then return end
                RequestModel(ModelHash)
                while not HasModelLoaded(ModelHash) do
                  Citizen.Wait(10)
                end

                floatvehicle = CreateVehicle(ModelHash, GetEntityCoords(vehicle), GetEntityHeading(ped), true, false)

                SetEntityCompletelyDisableCollision(floatvehicle, false, true)
                SetVehicleEngineHealth(vehicle, 0.0)

                AttachEntityToEntity(vehicle, floatvehicle, 0, 0, 0, 0, 0, 0, GetEntityHeading(ped), 0, false, true, false, 0, false)

                SetEntityVisible(floatvehicle, false, 0)
                SetEntityVisible(vehicle, true, 0)
            end
        end
        if not DoesEntityExist(vehicle) then
            DeleteEntity(floatvehicle)
        end
    end

end)
