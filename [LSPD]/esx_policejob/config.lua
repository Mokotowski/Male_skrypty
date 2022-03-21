Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerType2                 = 36 ---Auta
Config.MarkerType3                 = 21 ---wyciąganie
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerSize2                 = { x = 1.5, y = 1.5, z = 1.5 }--auta
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.Marker 			 		  = {Type = 27, r = 0, g = 127, b = 22}
Config.EnableArmoryManagement     = true
Config.EnableLicenses             = true
Config.EnableHandcuffTimer        = true
Config.HandcuffTimer              = 15 * 60000
Config.MaxInService               = -1
Config.Locale                     = 'pl'
Config.ReceiveAmmo = 250
Config.Colors = {
	{ label = _U('black'), value = 'black'},
	{ label = _U('white'), value = 'white'},
	{ label = _U('grey'), value = 'grey'},
	{ label = _U('red'), value = 'red'},
	{ label = _U('pink'), value = 'pink'},
	{ label = _U('blue'), value = 'blue'},
	{ label = _U('yellow'), value = 'yellow'},
	{ label = _U('green'), value = 'green'},
	{ label = _U('orange'), value = 'orange'},
	{ label = _U('brown'), value = 'brown'},
	{ label = _U('purple'), value = 'purple'},
	{ label = _U('chrome'), value = 'chrome'},
	{ label = _U('gold'), value = 'gold'}
}




Config.Blips = {
    {
        Pos     = { x = 446.16, y = -986.04, z = 1.15 },
        Sprite  = 60,
        Display = 4,
        Scale   = 0.8,
        Colour  = 38,
        Label = _U('komenda')
    },
}



Config.PoliceStations = {

	MissionRow = {
			Cloakrooms = {
				{ x = 462.17, y = -999.12, z = 29.75 }, 
				{ x = 462.17, y = -996.32, z = 29.75 }, 

			},


			Armories = {
				{ x = 482.54, y = -996.09, z = 29.69},
			},

			Vehicles = {
				{
					Spawner    = { x = 459.38677978516, y = -986.74731445313, z = 24.8 },
					SpawnPoint = { x = 445.40, y = -986.18, z = 24.8 },
					Heading    = 278.53
				},
				{
					Spawner    = { x = 473.00, y = -1019.39, z = 27.22 },
					SpawnPoint = { x = 480.71, y = -1022.69, z = 27.0 },
					Heading    = 280.53
				},
			},
			VehicleDeleters = {
				{ x = 476.04, y = -1026.5, z = 28.11 },
				{ x = 445.75, y = -986.10, z = 25.50 },
			},

			BossActions = {
				{ x = 460.5, y = -985.33, z = 29.8 },
			},
	},
	
}

Config.Dzwonek = {
    MissionRowPD = {
        Coords = {x = 441.94998168945, y = -984.28070068359, z = 31.989582824707},
    }
}
-- sam sobie robisz ubrania
Config.ClothesZone = {
	{x = 462.95, y = -996.57, z = -29.69}, --MR
}
--ilos policji na sluzbie
Config.Ilosc = {
	MissionRowPD = {
		Coords = {x = 441.86026000977, y = -979.53820800781, z = 31.989582824707},
	}
}
--nie działa
Config.RepairVeh = {
	{x = 443.22, y = -976.50, z =  -25.05}, --MR

}
 
Config.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
	{x = 449.25,  y = -981.3, z = 44.02}, --MR

		}
	}
}
Config.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
			{x = -719.69,  y = -1327.1, z = 0.6}
		}
	}
}

Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 436.76,  y = -994.22, z = -25.7}, --MR
			{x = 445.93,  y = -994.23, z = -25.7}, --MR
		}
	}
}

Config.Helicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 1 }
}
Config.Boats = {
	{ model = 'predator', label = 'Police Predator', livery = 0 }
}

Config.VehicleGroups = {
    'Adam', -- 1
    'Offroad', -- 2
    'SEU', -- 3
    'Unmarked', -- 4
    'Motory', -- 5
    'SWAT', -- 6
    'Eagle', -- 7
	'licencje'
}

Config.AuthorizedVehicles = {
	{
		grade = 1, -- nie zmieniaj
		model = 'HUMMER',     -- to co podam
		label = 'HUMMER' , -- jak ma się pokazać
		groups = {5}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3bmw',     -- to co podam
		label = 'Motor BMW ' , -- jak ma się pokazać
		groups = {4}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3cvpi',     -- to co podam
		label = 'Victoria' , -- jak ma się pokazać
		groups = {1}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3durango',     -- to co podam
		label = 'Dodge Durango' , -- jak ma się pokazać
		groups = {7}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3f150',     -- to co podam
		label = 'Ford f150' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3f250',     -- to co podam
		label = 'Ford f250' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3fpis',     -- to co podam
		label = 'Ford Fiesta ' , -- jak ma się pokazać
		groups = {1}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3gator',     -- to co podam
		label = 'Gator' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3harley',     -- to co podam
		label = 'Motor Harley' , -- jak ma się pokazać
		groups = {4}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3mustang',     -- to co podam
		label = 'Mustang' , -- jak ma się pokazać
		groups = {3}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code3silverado',     -- to co podam
		label = 'Silverado' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code314tahoe',     -- to co podam
		label = 'Tahoe' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code316fpiu',     -- to co podam
		label = 'Explorer 2016' , -- jak ma się pokazać
		groups = {2}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code316impala',     -- to co podam
		label = 'Ford Fiesta 2018' , -- jak ma się pokazać
		groups = {1}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code318charg',     -- to co podam
		label = 'Dodge charger 3' , -- jak ma się pokazać
		groups = {3}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code318chargk9',     -- to co podam
		label = 'Dodge charger 4' , -- jak ma się pokazać
		groups = {3}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
	{
		grade = 1, 
		model = 'code318tahoe',     -- to co podam
		label = 'Tahoe' , -- jak ma się pokazać
		groups = {7}, -- z grup
		livery = 1  -- nie zmieniać
	
	},
}

Config.Uniforms = {
	-- PODSTAWOWE STROJE 
	kadet = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 108,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 49,   ['pants_2'] = 0,
			['shoes_1'] = 63,   ['shoes_2'] = 4,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 10,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 63,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	oficershort = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 108,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 130,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 33,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 159,  ['tshirt_2'] = 0,
			['torso_1'] = 99,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 70,
			['pants_1'] = 11,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 24,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	oficerlong = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 130,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 33,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 53,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 1,
			['bproof_1'] = 33,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantshort = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 108,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 130,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 99,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 136,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantlong = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 130,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantboj = {
		male = {
		   ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		   ['torso_1'] = 319,   ['torso_2'] = 0,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 30,
		   ['pants_1'] = 31,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 135,      ['helmet_2'] = 1,
		   ['chain_1'] = 144,    ['chain_2'] = 0,
		   ['bproof_1'] = 57,     ['bproof_2'] = 0,
		   ['mask_1'] = 0,      ['mask_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0,
		   ['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		   ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		   ['torso_1'] = 328,   ['torso_2'] = 0,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 44,
		   ['pants_1'] = 30,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 134,  ['helmet_2'] = 1,
		   ['bproof_1'] = 0,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['chain_1'] = 0,    ['chain_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	porucznikshort = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 108,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 33,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 14,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 50,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	poruczniklong = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 33,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 53,
			['pants_1'] = 129,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	porucznikboj = {    
		male = {
		   ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		   ['torso_1'] = 92,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 30,
		   ['pants_1'] = 31,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 135,      ['helmet_2'] = 1,
		   ['chain_1'] = 144,    ['chain_2'] = 0,
		   ['bproof_1'] = 7,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0,
		   ['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		   ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		   ['torso_1'] = 328,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 44,
		   ['pants_1'] = 30,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 134,  ['helmet_2'] = 1,
		   ['bproof_1'] = 2,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['chain_1'] = 0,    ['chain_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	kapitanshort = {
		male = {
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 2,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,   ['bproof_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 121,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 329,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 10,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 47,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	kapitanlong = {
		male = {
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 102,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 32,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 332,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 47,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	kapitanboj = {
		male = {
		  ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 44,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 32,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		  	['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 332,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 47,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	commandershort = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 2,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 7,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 11,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	commanderlong = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 7,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 11,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 1,
			['bproof_1'] = 2,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	galowy = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 32,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 23,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	motocykl = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 92,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 32,   ['pants_2'] = 5,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 16,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 5,   ['bproof_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	aiad = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 294,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 131,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	swatalways = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 3,
            ['torso_1'] = 110,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 179,
            ['pants_1'] = 49,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 1,      ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['bproof_1'] =11,     ['bproof_2'] = 0,
            ['mask_1'] = 35,      ['mask_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
            ['torso_1'] = 324,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 130,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['bproof_1'] = 40,     ['bproof_2'] = 0,
            ['mask_1'] = 0,      ['mask_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        }
    },
    swatlight = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 108,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 171,
            ['pants_1'] = 49,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 1,      ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['bproof_1'] = 18,     ['bproof_2'] = 0,
            ['mask_1'] = 169,      ['mask_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
            ['torso_1'] = 324,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 130,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['bproof_1'] = 40,     ['bproof_2'] = 0,
            ['mask_1'] = 0,      ['mask_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        }
    },
    swatheavy = {
        male = {
            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
            ['torso_1'] = 110,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 179,
            ['pants_1'] = 59,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 129,      ['helmet_2'] = 0,
            ['chain_1'] = -1,    ['chain_2'] = 0,
            ['bproof_1'] = 5,     ['bproof_2'] = 2,
            ['mask_1'] = 169,      ['mask_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
            ['torso_1'] = 324,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 130,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['bproof_1'] = 40,     ['bproof_2'] = 0,
            ['mask_1'] = 0,      ['mask_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 15,     ['ears_2'] = 0
        }
    },
	-- KAMIZELKI
	kadet2 = {
		male = {
			['bproof_1'] = 10, ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 10, ['bproof_2'] = 4
		}
	},
	oficer2 = {
		male = {
			['bproof_1'] = 17, ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 17, ['bproof_2'] = 0
		}
	},
	sierzant2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		}
	},
	porucznik2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		}
	},
	kapitan2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	aiad2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	swat2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	swm2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	}
}