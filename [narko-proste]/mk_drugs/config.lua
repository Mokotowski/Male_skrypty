Config              = {}
Config.MarkerType   = 27
Config.DrawDistance = 10.0
Config.ZoneSize     = {x = 3.0, y = 3.0, z = 2.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}


Config.RequiredCopsCoke  = 0
Config.RequiredCopsMeth  = 0
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 0

Config.TimeToFarm    = 8 * 800
Config.TimeToProcess = 16 * 800
Config.TimeToSell    = 4  * 1000

Config.Locale = 'en'

Config.Zones = {
	CokeField =			{x = 780.51,	y = 1296.83,	z = 361.36,	name = _U('coke_field'),		sprite = 500,	color = 40},
	CokeProcessing =	{x =  2816.86,	y = 5978.16,	z = 350.00,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	MethField =			{x = 3808.23, y = 4478.74, z = 6.37,	name = _U('meth_field'),		sprite = 499,	color = 26}, 
	MethProcessing =	{x = 1389.15, y = 3605.29, z = 38.54,	name = _U('meth_processing'),	sprite = 499,	color = 26}, 
	WeedField =			{x = 1967.06,	y = 4634.18,	z = 41.1,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = 2213.53,    y = 5577.6,	z = 53.8,	name = _U('weed_processing'),	sprite = 496,	color = 52}, 
	OpiumField =		{x = 129.71,	y = -1260.21,	z = 29.47,	name = _U('opium_field'),		sprite = 51,	color = 60},
	OpiumProcessing =	{x = 880.28,	y = -942.82,	z = 27.86,	name = _U('opium_processing'),	sprite = 51,	color = 60},
}