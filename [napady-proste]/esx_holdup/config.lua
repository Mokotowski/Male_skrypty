
Config = {}
Config.Locale = 'pl'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob    = 5000 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = false -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = -709.38, y = -904.22, z = 19.22 },
		reward = math.random(20000, 40000),
		nameOfStore = "Twenty Fourseven ",
		secondsRemaining = 450, -- seconds
		lastRobbed = 2500
	},
	["paleto_2"] = {
		position = { x = -43.26, y = -1748.8, z = 29.42 },
		reward = math.random(20000, 40000),
		nameOfStore = "Twenty Fourseven #2",
		secondsRemaining = 450, -- seconds
		lastRobbed = 2500
	},
	["paleto_3"] = {
		position = { x = 1159.98, y = -314.22, z = 69.21 },
		reward = math.random(20000, 40000),
		nameOfStore = "Twenty Fourseven #3",
		secondsRemaining = 450, -- seconds
		lastRobbed = 2500
	},
	["paleto_4"] = {
		position = { x = -1828.65, y = 798.91, z = 138.18 },
		reward = math.random(20000, 40000),
		nameOfStore = "Twenty Fourseven #4",
		secondsRemaining = 450, -- seconds
		lastRobbed = 2500
	},
	["paleto_5"] = {
		position = { x = 1707.52, y = 4920.04, z = 42.06 },
		reward = math.random(20000, 40000),
		nameOfStore = "Twenty Fourseven #5",
		secondsRemaining = 450, -- seconds
		lastRobbed = 2500
	},
}
