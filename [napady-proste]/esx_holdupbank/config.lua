Config = {}
Config.Locale = 'en'
Config.NumberOfCopsRequired = 0

Banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = math.random(150000,250000),
		nameofbank = "Nordea",
		lastrobbed = 3600
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = math.random(150000,250000),
		nameofbank = "Fleeca Bank (Highway)",
		lastrobbed = 3600
	},
	["PrincipalBank"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = math.random(500000,750000),
		nameofbank = "Pacific Bank",
		lastrobbed = 14400
	}
}