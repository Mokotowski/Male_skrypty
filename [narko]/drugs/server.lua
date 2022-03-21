ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('drugs:canCarryItem', function(source, cb, item, count)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.canCarryItem(item, count) then
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback("drugs:checkItem", function(source, cb, itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname).count
    if item >= count then
        cb(true)
    else
        cb(false)
    end
end)






RegisterServerEvent("drugs:removeItem")
AddEventHandler("drugs:removeItem", function(itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(itemname, count)
end)

RegisterServerEvent("drugs:removeItemAll")
AddEventHandler("drugs:removeItemAll", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getInventoryItem(itemname).count
    xPlayer.removeInventoryItem(itemname, count)
end)

RegisterServerEvent("drugs:giveMoney")
AddEventHandler("drugs:giveMoney", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if Config.BlackMoney then
            xPlayer.addAccountMoney('black_money', count)
        else
            xPlayer.addMoney(count)
        end
    end
end)

RegisterServerEvent("drugs:giveBlackMoney2")
AddEventHandler("drugs:giveBlackMoney2", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addAccountMoney('black_money', count)
    end
end)

RegisterServerEvent("drugs:giveBlackMoney")
AddEventHandler("drugs:giveBlackMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = math.random(100, 200)
    if xPlayer then
        xPlayer.addAccountMoney('black_money', count)
    end
end)


RegisterServerEvent("drugs:giveItem")
AddEventHandler("drugs:giveItem", function(item, ilosc)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if item == 'weed' or item == 'coca' or item == 'meth' or item == 'packagedweedslaba' or item == 'packagedweedsrednia' or item == 'packagedweedmocna' or item == 'packagedmethmslaba' or item == 'packagedmethsrednia' or item == 'packagedmethmocna' or item == 'packagedcocaslaba' or item == 'packagedcocasrednia' or item == 'packagedcocamocna' then
        xPlayer.addInventoryItem(item, ilosc)
    else
        -- Triggerban
    end
end)

ESX.RegisterServerCallback("drugs:checkBlackMoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local blackcount = xPlayer.getAccount('black_money').money
    if blackcount > 0 then
        cb(blackcount)
    else
        cb(false)
    end
end)

RegisterServerEvent("drugs:removeBlackMoney")
AddEventHandler("drugs:removeBlackMoney", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = xPlayer.getAccount('black_money').money
    if xPlayer then
        xPlayer.removeAccountMoney('black_money', count)
    end
end)

RegisterServerEvent("drugs:addMoney")
AddEventHandler("drugs:addMoney", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addMoney(count)
    end
end)

ESX.RegisterServerCallback('drugs:checkitem', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local weed = xPlayer.getInventoryItem('weed').count
    local coca = xPlayer.getInventoryItem('coca').count
    local meth = xPlayer.getInventoryItem('meth').count
    cb(weed, coca,  meth)
end) 



