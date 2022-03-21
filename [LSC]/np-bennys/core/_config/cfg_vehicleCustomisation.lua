--[[
cfg_vehicleCustomisation.lua
Configuration file that contains information regarding the customisation of the vehicles.
]]

--Set to 0 to have all the upgrades.
maxVehiclePerformanceUpgrades = 3

vehicleBaseRepairCost = 400
vehicleRepairCostMultiplier = 1

vehicleCustomisationPrices =
{
    cosmetics = 
    {
        price = 400
    },
    respray = 
    {
        price = 500
    },
    performance = 
    {
        prices = 
        {
            0,
            3250,
            5500,
            10450,
            15250,
            20500
        }
    },
    turbo = 
    {
        price = 15000
    },
    wheels = 
    {
        price = 400
    },
    customwheels = 
    {
        price = 600
    },
    wheelDym = 
    {
        price = 400
    },
    windowtint = 
    {
        price = 400
    },
    neonside = 
    {
        price = 100
    },
    neoncolours = 
    {
        price = 500
    },
    headlights = 
    {
        price = 100
    },
    xenoncolours = 
    {
        price = 500
    },
    oldlivery = 
    {
        price = 100
    },
    plateindex = 
    {
        price = 1000
    }
}

vehicleCustomisation = 
{
    {
        category = "Spoiler",
        id = 0
    },
    {
        category = "Przedni Zderzak",
        id = 1
    },
    {
        category = "Tylny Zderzak",
        id = 2
    },
    {
        category = "Progi",
        id = 3
    },
    {
        category = "Wydech",
        id = 4
    },
    {
        category = "Roll Cage",
        id = 5
    },
    {
        category = "Grille",
        id = 6
    },
    {
        category = "Pasy",
        id = 7
    },
    {
        category = "Lewy błotnik",
        id = 8
    },
    {
        category = "Prawy błotnik",
        id = 9
    },
    {
        category = "Dach",
        id = 10
    },
    {
        category = "Tablice",
        id = 25
    },
    {
        category = "Trim A",
        id = 27
    },
    {
        category = "Ozdoby",
        id = 28
    },
    {
        category = "Deska rozdzielcza",
        id = 29
    },
    {
        category = "Dial",
        id = 30
    },
    {
        category = "Głośnik Drzwiowy",
        id = 31
    },
    {
        category = "Siedzenia",
        id = 32
    },
    {
        category = "Kierownica",
        id = 33
    },
    {
        category = "Dźwignia Zmiany Biegów",
        id = 34
    },
    {
        category = "Plaque",
        id = 35
    },
    {
        category = "Głośniki",
        id = 36
    },
    {
        category = "Bagażnik Samochodowy",
        id = 37
    },
    {
        category = "Hydrulika",
        id = 38
    },
    {
        category = "Blok Silnika",
        id = 39
    },
    {
        category = "Filtr Powietrza",
        id = 40
    },
    {
        category = "Strut",
        id = 41
    },
    {
        category = "Arch Cover",
        id = 42
    },
    {
        category = "Antena",
        id = 43
    },
    {
        category = "Trim B",
        id = 44
    },
    {
        category = "Fuel Tank",
        id = 45
    },
    {
        category = "Okna",
        id = 46
    },
    {
        category = "Livery",
        id = 48
    },
    {
        category = "Klaksony",
        id = 14,
        hornNames = 
        {
            {name = "Truck Horn", id = 0},
            {name = "Cop Horn", id = 1},
            {name = "Clown Horn", id = 2},
            {name = "Musical Horn 1", id = 3},
            {name = "Musical Horn 2", id = 4},
            {name = "Musical Horn 3", id = 5},
            {name = "Musical Horn 4", id = 6},
            {name = "Musical Horn 5", id = 7},
            {name = "Sad Trombone", id = 8},
            {name = "Classical Horn 1", id = 9},
            {name = "Classical Horn 2", id = 10},
            {name = "Classical Horn 3", id = 11},
            {name = "Classical Horn 4", id = 12},
            {name = "Classical Horn 5", id = 13},
            {name = "Classical Horn 6", id = 14},
            {name = "Classical Horn 7", id = 15},
            {name = "Scale - Do", id = 16},
            {name = "Scale - Re", id = 17},
            {name = "Scale - Mi", id = 18},
            {name = "Scale - Fa", id = 19},
            {name = "Scale - Sol", id = 20},
            {name = "Scale - La", id = 21},
            {name = "Scale - Ti", id = 22},
            {name = "Scale - Do", id = 23},
            {name = "Jazz Horn 1", id = 24},
            {name = "Jazz Horn 2", id = 25},
            {name = "Jazz Horn 3", id = 26},
            {name = "Jazz Horn Loop", id = 27},
            {name = "Star Spangled Banner 1", id = 28},
            {name = "Star Spangled Banner 2", id = 29},
            {name = "Star Spangled Banner 3", id = 30},
            {name = "Star Spangled Banner 4", id = 31},
            {name = "Classical Horn 8 Loop", id = 32},
            {name = "Classical Horn 9 Loop", id = 33},
            {name = "Classical Horn 10 Loop", id = 34},
            {name = "Classical Horn 8", id = 35},
            {name = "Classical Horn 9", id = 36},
            {name = "Classical Horn 10", id = 37},
            {name = "Funeral Loop", id = 38},
            {name = "Funeral", id = 39},
            {name = "Spooky Loop", id = 40},
            {name = "Spooky", id = 41},
            {name = "San Andreas Loop", id = 42},
            {name = "San Andreas", id = 43},
            {name = "Liberty City Loop", id = 44},
            {name = "Liberty City", id = 45},
            {name = "Festive 1 Loop", id = 46},
            {name = "Festive 1", id = 47},
            {name = "Festive 2 Loop", id = 48},
            {name = "Festive 2", id = 49},
            {name = "Festive 3 Loop", id = 50},
            {name = "Festive 3", id = 51}
        }
    },
    {
        category = "Ulepszenie Silnika",
        id = 11
    },
    {
        category = "Ulepszenie Hamulców",
        id = 12
    },
    {
        category = "Ulepszenie Skrzyni Biegów",
        id = 13
    },
    {
        category = "Ulepszenie Zawieszenia",
        id = 15
    },
    {
        category = "Ulepszenie Opancerzenia",
        id = 16
    },
    {
        category = "Ulepszenie Turbo",
        id = 18
    }
}

vehicleWindowTintOptions = 
{
    {
        name = "Nic",
        id = 0
    },
    {
        name = "Czysta Czerń",
        id = 1    
    },
    {
        name = "Ciemny Dym",
        id = 2
    },
    {
        name = "Jasny Dym",
        id = 3
    }
}

vehicleWheelOptions = 
{
    {
        category = "Opony niestandardowe",
        id = -1,
        wheelID = 23
    },
    {
        category = "Dym z opon",
        id = 20,
        wheelID = 23
    },
    {
        category = "Sportowe",
        id = 0,
        wheelID = 23
    },
    {
        category = "Muscle",
        id = 1,
        wheelID = 23
    },
    {
        category = "Lowrider",
        id = 2,
        wheelID = 23
    },
    {
        category = "SUV",
        id = 3,
        wheelID = 23
    },
    {
        category = "Offroad",
        id = 4,
        wheelID = 23
    },
    {
        category = "Tuner",
        id = 5,
        wheelID = 23
    },
    {
        category = "Motocyklowe",
        id = 6,
        wheelID = 23
    },
    {
        category = "Wysokiej klasy",
        id = 7,
        wheelID = 23
    }
}

vehicleTyreDymOptions = 
{
    {name = "Białt Dym", r = 254, g = 254, b = 254},
    {name = "Czarny Dym", r = 1, g = 1, b = 1},
    {name = "Niebieski Dym", r = 0, g = 150, b = 255},
    {name = "Żółty Dym", r = 255, g = 255, b = 50},
    {name = "Pomarańczowe Dym", r = 255, g = 153, b = 51},
    {name = "Czerwony Dym", r = 255, g = 10, b = 10},
    {name = "Zielony Dym", r = 10, g = 255, b = 10},
    {name = "Fioletowy Dym", r = 153, g = 10, b = 153},
    {name = "Różowy Dym", r = 255, g = 102, b = 178},
    {name = "Szary Dym", r = 128, g = 128, b = 128}
}

vehicleResprayCategories = 
{
    {
        category = "Kolor Podstawowy",
        id = 0
    },
    {
        category = "Dodatkowy kolor",
        id = 1
    },
    {
        category = "Kolor Perłowy",
        id = 2
    },
    {
        category = "Kolor Koła",
        id = 3
    },
    {
        category = "Kolor Deski Rozdzielczej",
        id = 4
    },
    {
        category = "Kolor Wnętrza",
        id = 5
    }
}

vehicleResprayOptions =
{
    --[[{
        category = "Classic",
        id = 0,
        colours =
        {
            {name = "Black", id = 0},
            {name = "Carbon Black", id = 147},
            {name = "Graphite", id = 1},
            {name = "Anhracite Black", id = 11},
            {name = "Black Steel", id = 11},
            {name = "Dark Steel", id = 3},
            {name = "Silver", id = 4},
            {name = "Bluish Silver", id = 5},
            {name = "Rolled Steel", id = 6},
            {name = "Shadow Silver", id = 7},
            {name = "Stone Silver", id = 8},
            {name = "Midnight Silver", id = 9},
            {name = "Cast Iron Silver", id = 10},
            {name = "Red", id = 27},
            {name = "Torino Red", id = 28},
            {name = "Formula Red", id = 29},
            {name = "Lava Red", id = 150},
            {name = "Blaze Red", id = 30},
            {name = "Grace Red", id = 31},
            {name = "Garnet Red", id = 32},
            {name = "Sunset Red", id = 33},
            {name = "Cabernet Red", id = 34},
            {name = "Wine Red", id = 143},
            {name = "Candy Red", id = 35},
            {name = "Hot Pink", id = 135},
            {name = "Pfsiter Pink", id = 137},
            {name = "Salmon Pink", id = 136},
            {name = "Sunrise Orange", id = 36},
            {name = "Orange", id = 38},
            {name = "Bright Orange", id = 138},
            {name = "Gold", id = 99},
            {name = "Bronze", id = 90},
            {name = "Yellow", id = 88},
            {name = "Race Yellow", id = 89},
            {name = "Dew Yellow", id = 91},
            {name = "Dark Green", id = 49},
            {name = "Racing Green", id = 50},
            {name = "Sea Green", id = 51},
            {name = "Olive Green", id = 52},
            {name = "Bright Green", id = 53},
            {name = "Gasoline Green", id = 54},
            {name = "Lime Green", id = 92},
            {name = "Midnight Blue", id = 141},
            {name = "Galaxy Blue", id = 61},
            {name = "Dark Blue", id = 62},
            {name = "Saxon Blue", id = 63},
            {name = "Blue", id = 64},
            {name = "Mariner Blue", id = 65},
            {name = "Harbor Blue", id = 66},
            {name = "Diamond Blue", id = 67},
            {name = "Surf Blue", id = 68},
            {name = "Nautical Blue", id = 69},
            {name = "Racing Blue", id = 73},
            {name = "Ultra Blue", id = 70},
            {name = "Light Blue", id = 74},
            {name = "Chocolate Brown", id = 96},
            {name = "Bison Brown", id = 101},
            {name = "Creeen Brown", id = 95},
            {name = "Feltzer Brown", id = 94},
            {name = "Maple Brown", id = 97},
            {name = "Beechwood Brown", id = 103},
            {name = "Sienna Brown", id = 104},
            {name = "Saddle Brown", id = 98},
            {name = "Moss Brown", id = 100},
            {name = "Woodbeech Brown", id = 102},
            {name = "Straw Brown", id = 99},
            {name = "Sandy Brown", id = 105},
            {name = "Bleached Brown", id = 106},
            {name = "Schafter Purple", id = 71},
            {name = "Spinnaker Purple", id = 72},
            {name = "Midnight Purple", id = 142},
            {name = "Bright Purple", id = 145},
            {name = "Cream", id = 107},
            {name = "Ice White", id = 111},
            {name = "Frost White", id = 112}
        }
    },]]
    {
        category = "Metaliczne",
        id = 1,
        colours = 
        {
            {name = "Czarny", id = 0},
            {name = "Czarny Karbon", id = 147},
            {name = "Grafitowy", id = 1},
            {name = "Antracytowa Czerń", id = 11},
            {name = "Czarna Stal", id = 11},
            {name = "Ciemna Stal", id = 3},
            {name = "Srebrny", id = 4},
            {name = "Niebieskawy Srebrny", id = 5},
            {name = "Walcowana Stal", id = 6},
            {name = "Srebrny Cień", id = 7},
            {name = "Srebtny Kamień", id = 8},
            {name = "Srebro O Północy", id = 9},
            {name = "Odlane Srebrne Żelazo", id = 10},
            {name = "Czerwony", id = 27},
            {name = "Czerwony Turyn", id = 28},
            {name = "Czerwona Formuła", id = 29},
            {name = "Czerwona Lawa", id = 150},
            {name = "Ognista Czerwień", id = 30},
            {name = "Czerwona Łaska", id = 31},
            {name = "Czerwony Granat", id = 32},
            {name = "Czerwony Zachód Słońca", id = 33},
            {name = "Czerwony Cabernet", id = 34},
            {name = "Czerwone Wino", id = 143},
            {name = "Cukierkowy Czerwony", id = 35},
            {name = "Gorący Różowy", id = 135},
            {name = "Różowy Pfister", id = 137},
            {name = "Łososiowy Róż", id = 136},
            {name = "Pomarańczowy Wschód Słońca", id = 36},
            {name = "Pomarańczowy", id = 38},
            {name = "Jasno Pomarańczowy", id = 138},
            {name = "Złoty", id = 99},
            {name = "Brązowy", id = 90},
            {name = "Żółty", id = 88},
            {name = "Wyścigowa Żółć", id = 89},
            {name = "Żółta Rosa", id = 91},
            {name = "Ciemna Zieleń", id = 49},
            {name = "Wyścigowa Zieleń", id = 50},
            {name = "Morska Zieleń", id = 51},
            {name = "Zielona Oliwka", id = 52},
            {name = "Jasno Zielony", id = 53},
            {name = "Zielona Benzyna", id = 54},
            {name = "Limonkowy", id = 92},
            {name = "Niebieska Północ", id = 141},
            {name = "Niebieska Galaktyka", id = 61},
            {name = "Ciemny Niebieski", id = 62},
            {name = "Saksoński Niebieski", id = 63},
            {name = "Niebieski", id = 64},
            {name = "Marynarski", id = 65},
            {name = "Portowy", id = 66},
            {name = "Niebieski Diament", id = 67},
            {name = "Serferski Niebieski", id = 68},
            {name = "Morski Niebieski", id = 69},
            {name = "Wyścigowy Niebieski", id = 73},
            {name = "Ultra Niebieski", id = 70},
            {name = "Jasny Niebieski", id = 74},
            {name = "Czekoladowy Brąz", id = 96},
            {name = "Brązowy Żubr", id = 101},
            {name = "Creeen Brown", id = 95},
            {name = "Brązowy Feltzer", id = 94},
            {name = "Brązowy Klon", id = 97},
            {name = "Brązowy Buk", id = 103},
            {name = "Brązowa Sjena", id = 104},
            {name = "Brązowe Siodło", id = 98},
            {name = "Brązowy Mech", id = 100},
            {name = "Brązowe Drewno Bukowe", id = 102},
            {name = "Brązowa Słoma", id = 99},
            {name = "Piassowy Brąz", id = 105},
            {name = "Bielony Brąz", id = 106},
            {name = "Purpurowy Schafter", id = 71},
            {name = "Fioletowy Spinaker", id = 72},
            {name = "Północny Fiolet", id = 142},
            {name = "Jasnofioletowy", id = 145},
            {name = "Kremowy", id = 107},
            {name = "Lodowa Biel", id = 111},
            {name = "Mroźna Biel", id = 112}
        }
    },
    {
        category = "Matowe",
        id = 2,
        colours = 
        {
            {name = "Czarny", id = 12},
            {name = "Szary", id = 13},
            {name = "Jasny Szary", id = 14},
            {name = "Lodowa Biel", id = 131},
            {name = "Niebieski", id = 83},
            {name = "Ciemny Niebieski", id = 82},
            {name = "Nebieska Północ", id = 84},
            {name = "Fioletowa Połnoc", id = 149},
            {name = "Fioletowy Schafter", id = 148},
            {name = "Czerwony", id = 39},
            {name = "Ciemny Czerwony", id = 40},
            {name = "Pomarńczowy", id = 41},
            {name = "Żółty", id = 42},
            {name = "Limonkowy", id = 55},
            {name = "Zielony", id = 128},
            {name = "Zielony Las", id = 151},
            {name = "Zielone Liście", id = 155},
            {name = "Olive Darb", id = 152},
            {name = "Ciemna Ziemia", id = 153},
            {name = "Pustynny Dębnik ", id = 154}
        }
    },
    {
        category = "Metale",
        id = 3,
        colours = 
        {
            {name = "Szczotkowana Stal", id = 117},
            {name = "Szczotkowana Czarna Stal", id = 118},
            {name = "Szczotkowane Aluminium", id = 119},
            {name = "Czyste Złoto", id = 158},
            {name = "Szczotkowane Złoto", id = 159},
            {name = "Chrom", id = 120}
        }
    }
}

vehicleNeonOptions = 
{
    category = "Neony",
    neonTypes = 
    {
        {name = "Przód Neon", id = 2},
        {name = "Tył Neon", id = 3},
        {name = "Lewy Neon", id = 0},
        {name = "Prawy Neon", id = 1}
    },
    neonColours = 
    {
        {name = "Biały", r = 222, g = 222, b = 255},
        {name = "Niebieski", r = 2, g = 21, b = 255},
        {name = "Eletryczny Niebieski", r = 3, g = 83, b = 255},
        {name = "Miętowy", r = 0, g = 255, b = 140},
        {name = "Limonkowy", r = 94, g = 255, b = 1},
        {name = "Żółty", r = 255, g = 255, b = 0},
        {name = "Złoty Prysznic", r = 255, g = 150, b = 0},
        {name = "Pomarańczowy", r = 255, g = 62, b = 0},
        {name = "Czerwony", r = 255, g = 1, b = 1},
        {name = "Różowy Kucyk", r = 255, g = 50, b = 100},
        {name = "Gorący Różowy", r = 255, g = 5, b = 190},
        {name = "Fioletowy", r = 35, g = 1, b = 255},
        {name = "Czarne Światło", r = 15, g = 3, b = 255}
    }
}

vehicleXenonOptions = 
{
    xenonColours = 
    {
        {name = "Stock", id = 255},
        {name = "Biały", id = 0},
        {name = "Niebieski", id = 1},
        {name = "Elektryczny Niebieski", id = 2},
        {name = "Miętowy", id = 3},
        {name = "Limonkowy", id = 4},
        {name = "Żółty", id = 5},
        {name = "Złoty Prysznic", id = 6},
        {name = "Pomarańczowy", id = 7},
        {name = "Czerwony", id = 8},
        {name = "Różowy Kucyk", id = 9},
        {name = "Gorący Kucyk", id = 10},
        {name = "Fioletowy", id = 11},
        {name = "Czarne Światło", id = 12}
    }
}