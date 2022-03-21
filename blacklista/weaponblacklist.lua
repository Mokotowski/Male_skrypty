-- CONFIG --

-- Blacklisted weapons
weaponblacklist = 
{
  "weapon_dagger" ,
  "weapon_bat" ,
  "weapon_bottle" ,
  "weapon_crowbar" ,
  "WEAPON_GOLFCLUB" ,
  "weapon_hammer" ,
  "WEAPON_HATCHET" ,
  "WEAPON_WRENCH" ,
  "WEAPON_BATTLEAXE" ,
  "WEAPON_POLCUE" ,
  "weapon_knuckle" ,
  "weapon_machete" ,
  "weapon_wrench" ,
  "weapon_battleaxe" ,
  "weapon_poolcue" ,
  "WEAPON_STONE_HATCHET" ,
  "WEAPON_PISTOL50" ,
  "WEAPON_SNSPISTOL_MK2" ,
  "WEAPON_FLAREGUN" ,
  "WEAPON_MARKSMANPISTOL" ,
  "WEAPON_REVOLVER" ,
  "WEAPON_REVOLVER_MK2" ,
  "WEAPON_DOUBLEACTION" ,
  "WEAPON_RAYPISTOL" ,
  "WEAPON_NAVYREVOLVER" ,
  "weapon_ceramicpistol" ,
  "WEAPON_GADGETPISTOL" ,


  "weapon_microsmg" ,
  "weapon_combatpdw" ,
  "weapon_smg_mk2" ,
  "weapon_assaultsmg" ,
  "weapon_machinepistol" ,
  "weapon_minismg" ,
  "weapon_raycarbine" ,

  "weapon_pumpshotgun_mk2" ,
  "weapon_sawnoffshotgun" ,
  "weapon_assaultshotgun" ,
  "weapon_bullpupshotgun" ,
  "weapon_musket" ,
  "weapon_heavyshotgun" ,
  "weapon_dbshotgun" ,
  "weapon_autoshotgun" ,
  "weapon_combatshotgun" ,



  "weapon_assaultrifle_mk2" ,
  "weapon_carbinerifle_mk2" ,
  "weapon_advancedrifle" ,
  "weapon_specialcarbine" ,
  "weapon_specialcarbine_mk2" ,
  "weapon_bullpuprifle" ,
  "weapon_bullpuprifle_mk2" ,
  "weapon_compactrifle" ,
  "weapon_mg" ,
  "weapon_combatmg" ,
  "weapon_combatmg_mk2" ,
  "weapon_gusenberg" ,
  "weapon_sniperrifle" ,
  "weapon_heavysniper" ,
  "weapon_marksmanrifle" ,
  "weapon_marksmanrifle_mk2" ,
  "weapon_rpg" ,
  "weapon_grenadelauncher" ,
  "weapon_grenadelauncher_smoke" ,
  "weapon_minigun" ,
  "weapon_firework" ,
  "weapon_railgun" ,
  "weapon_hominglauncher" ,
  "weapon_compactlauncher" ,
  "weapon_rayminigun" ,
  "weapon_grenade" ,
  "weapon_molotov" ,
  "weapon_stickybomb" ,
  "weapon_proxmine" ,
  "weapon_pipebomb" ,
  "weapon_ball" ,
  "weapon_hazardcan" ,

}
  
  
	
disableallweapons = false

Citizen.CreateThread(function()
	while true do
		Wait(500)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)
			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					SetEntityAsMissionEntity( weapon, true, true )
					RemoveWeaponFromPed(playerPed, weapon)
					sendForbiddenMessage(" Mokotowski pozdrawia ;)")
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) or model == 2210333304 then
			return true
		end
	end

	return false
end