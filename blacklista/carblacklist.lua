-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {	
	"INSURGENT",
	"INSURGENT2",
	"BARRACKS2",
	"BARRACKS3",
	"BALLER5",
	"BALLER6",
	"BLIMP",
	"BULLDOZER",
	"CARGOPLANE",
	"COG552",
	"COGNOSCENTI2",
	"CUBAN800",
	"CUTTER",
	"DUKES2",
	"DUMP",
	"DUSTER",
	"JET",
	"KURUMA2",
	"LAZER" ,
	"LIMO2",
	"VOLATOL",
	"HYDRA" ,
	"RIHNO" ,
	"SAVAGE",
	"BUZZARD",
	"BOMBUSHKA",
	"LUXOR2",
	"MAMARUS",
	"NIMBUS",
	"SHAMAL",
	"TECHNICAL",
    "STROMBERG",
    "VOLTIC2",
    "OPPRESSOR",
    "BLAZER5",
    "DELUXO",
    "OPPRESSOR2",
    "RUINER2",
    "KHANJALI",
    "THRUSTER",
    "NIGHTSHARK",
    "APC",
	"CHERNOBOG",
    "HALFTRACK",
    "AVENGER",
    "MOGUL",
    "STARLING",
    "TULA",
    "ANNIHILATOR",
    "AKULA",
    "HUNTER",
    "VALKYRIE",
    "DUSTER",
	"Asea2" ,
	"Mesa2" ,
	"RancherXL2" ,
	"Sadler2" ,
	"PoliceOld2" ,
	"PoliceOld1" ,
	"Stockade3" ,
	"Burrito5" ,
	"Emperor3" ,

}

Citizen.CreateThread(function()
	while true do
		Wait(500)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			SetEntityAsMissionEntity( car, true, true )
			_DeleteEntity(car)

		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end