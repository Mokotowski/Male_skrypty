Config = {}

Config.Debug = false

Config.Control = {
  Key = "e",
  Name = "~INPUT_CONTEXT~"
}

Config.Cutscenes = {
  enabled = true,
  long = false
}

Config.DrawDistance = 5.0

Config.ActivationDistanceScaler = 1.2

Config.Blip = {
  Sprite = 307,
  Color = 4,
  Size = 0.7,
  LosSantosName = "Cayo Perico Island",
  IslandName = "Los Santos",
  MinimapOnly = true
}

Config.Marker = {
  Type = 23,
  Color = {
    Red = 255,
    Green = 0,
    Blue = 0,
    Alpha = 255
  },
  Size = 1.0
}

-- An array of locations to teleport to/from the island.
Config.TeleportLocations = {
  {
    LosSantosCoordinate = vector3(-1045.63, -2751.53, 21.36 -0.95),
    LosSantosHeading = 357.31,
    IslandCoordinate = vector3(4425.67, -4485.28, 4.24 -0.95),
    IslandHeading = 241.13
  }
}