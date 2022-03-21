Config = {}

Config.BlackMoney = true -- for hold corner system




Config.ItemsName = {

    ["packagedweed"] = "Spakowana marihuana",
    ["packagedmeth"] = "Spakowana metaamfetamina",
    ["packagedcoca"] = "Spakowana kokaina",
    ["packagedweedslaba"] = "Słaba paczka marichuany",
    ["packagedweedsrednia"] = "Średnia paczka marichuany",
    ["packagedweedmocna"] = "Mocna paczka marichuany",
    ["packagedmethmslaba"] = "Słaba paczka metaamfetaminy",
    ["packagedmethsrednia"] = "Średnia paczka metaamfetaminy",
    ["packagedmethmocna"] = "Mocna paczka metaamfetaminy",
    ["packagedcocaslaba"] = "Słaba paczka kokainy",
    ["packagedcocasrednia"] = "Średnia paczka kokainy",
    ["packagedcocamocna"] = "Mocna paczka kokainy",


}


Config.methLab = {

    entry = { -- DON'T TOUCH!
        coord = vector3(5137.44 , -5123.62, 2.94), 
        intcoord = vector3(997.48, -3200.8, -36.4), 
        entryheading = 259.3,
        intheading = 259.19,
        text = "[E] Użyj karty dostępu", 
        requiredItem = true,
        item = "labcard", 
    },
    exit = { -- DON'T TOUCH!
        intcoord = vector3(997.16, -3200.64, -36.4), 
        coord = vector3(5137.44 , -5123.62, 2.94), 
        text = "[E] Wyjdź",
        heading = 90.0, 
    },
    cookZone = { -- DON'T TOUCH!
        coord = vector3(1005.80,-3200.40,-38.52),
        text = "[E] Ugotuj",
        startingCoord = vector3(1007.76, -3200.64, -39.0),
        startingText = "[E] Włącz piekarnik",
        methMinCount = 2,
        methMaksCount = 4,
        takeMethText = "[E] Zbierz "
    },
    packageZone = { -- DON'T TOUCH!
        coord = vector3(1011.80,-3194.90,-38.99),
        text = "[E] Spakuj metaamfetamine",
        takeMethText = "[E] Zbierz",
        
    }

}

Config.Coca = {

    entry = { -- DON'T TOUCH!
        coord = vector3(4930.74, -5295.64, 5.69), 
        intcoord = vector3(1088.56, -3188.12, -39.0), 
        intheading = 183.55,
        text = "[E] Wejdź", 
    },
    exit = { -- DON'T TOUCH!
        intcoord = vector3(1088.72, -3187.8, -39.0), 
        coord = vector3(4930.74, -5295.64, 5.69), 
        text = "[E] Wyjdź",
        heading = 90.0, 
    }, 
    gatheringZone = {
        coords = {
            [1] = {coord = vector3(1093.0, -3194.84, -39.0), heading = 183.39, rotx = -1.91, roty = -0.32, rotz = -0.60},
            [2] = {coord = vector3(1095.4, -3194.92, -39.0), heading = 183.39, rotx = -1.91, roty = -0.32, rotz = -0.60},
            [3] = {coord = vector3(1090.32, -3194.88, -39.0), heading = 183.39, rotx = -2.0, roty = -0.32, rotz = -0.60},
        },
        text = "[E] Zbieranie kokainy",
        requiredItemcoca = true,
        takeCoca = "[E] Zbierz",
        count = 1, 
    },
    packageZone = {
        coord = vector3(1101.245,-3198.82,-39.0),
        text = "[E] Pakowanie kokainy",
        takePackCoc = "[E] Zbierz",
        heading = 180.34,
        count = 1, 
    }
}

Config.Weed = {
    entry = {
        coord = vector3(-1144.37, 4908.47, 220.97),
        intcoord = vector3(1066.0, -3183.48, -39.16),
        intheading = 233.2,
        text = "[E] Wejdź",
    },
    exit = {
        intcoord = vector3(1066.0, -3183.48, -39.16),
        coord = vector3(-1144.37, 4908.47, 220.97),
        heading = 254.92,
        text = "[E] Wyjdź",
    },
    gatheringZone = {
        coords = {
            [1] = {coord = vector3(1057.56, -3196.76, -39.16), heading = 170.81},
            [2] = {coord = vector3(1062.92, -3190.92, -39.16), heading = 170.81},
            [3] = {coord = vector3(1051.44, -3204.0, -39.12), heading = 170.81},
        },
        text = "[E] Zbieranie marihuany",
        count = 1,
    },
    packageZone = {
        coords = {
            [1] = {coord =  vector3(1039.08, -3205.88, -37.72), heading = 83.31, rotx = -0.60, roty = 0.0, rotz = -1.4},
            [2] = {coord = vector3(1034.56, -3206.16, -37.68), heading = 83.31, rotx = -0.60, roty = 0.0, rotz = -1.4},
        },
        text = "[E] Pakowanie marihuany",
        count = 1, 
        takeText = "[E] Zbierz",
    }
}
