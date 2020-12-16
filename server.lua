ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('utx-taco:etver')
AddEventHandler('utx-taco:etver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addInventoryItem('tacoeti', 1)
end)

RegisterServerEvent('utx-taco:tacover')
AddEventHandler('utx-taco:tacover', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('tacoeti').count >= 3 then
        xPlayer.removeInventoryItem('tacoeti', 3)
        Citizen.Wait(500)
        xPlayer.addInventoryItem('taco', 1)
    end
end)

RegisterServerEvent('utx-taco:paketver')
AddEventHandler('utx-taco:paketver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('taco').count >= 1 then
        xPlayer.removeInventoryItem('taco', 1)
        Citizen.Wait(500)
        xPlayer.addInventoryItem('tacopaketi', 1)
    end
end)

RegisterServerEvent('utx-taco:tacosat')
AddEventHandler('utx-taco:tacosat', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = math.random(25, 225)
    if xPlayer.getInventoryItem('tacopaketi').count >= 1 then
        xPlayer.removeInventoryItem('tacopaketi', 1)
        Citizen.Wait(500)
        xPlayer.addMoney(money)
    end
end)

ESX.RegisterServerCallback('utx-taco:malzemekontrol', function(source, cb, item, gereklisayi)
	local xPlayer = ESX.GetPlayerFromId(source)
	itemcount = xPlayer.getInventoryItem(item).count
	if itemcount >= gereklisayi then
		cb(true)
	else
        activity = 0
        TriggerClientEvent('esx:showNotification', source, 'Üzerinde yeterli malzeme yok!')
	end
end)