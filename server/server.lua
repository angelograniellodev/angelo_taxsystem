Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.TimeCheck)
        TriggerClientEvent("angelo_taxsytem:start_system", -1)
        Debug("angelo_taxsystem: The system test has been started")
    end
end)

function GetOwnedVehicleCount(identifier)
    local count = 0
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()

    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM owned_vehicles WHERE owner = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result then
            count = tonumber(result)
            Debug("angelo_taxsystem: Check vehicles sql")
            if count > Config.SystemData.vehicles_max then
                xPlayer.removeAccountMoney('bank', Config.SystemData.vehicles_money_pax_tax)
                xPlayer.showNotification("Pagaste taxes por tener mas de 5 vehiculos a tu nombre, cantidad: "..Config.SystemData.vehicles_money_pax_tax)
                Debug("angelo_taxsystem: Taxes vehicles paid")
            end
        end
    end)
end


RegisterServerEvent("angelo_taxsystem:check_system")
AddEventHandler("angelo_taxsystem:check_system", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local bankCount = xPlayer.getAccount('bank').money
    GetOwnedVehicleCount()
    if bankCount > Config.SystemData.bank_money_max then
        xPlayer.removeAccountMoney('bank', Config.SystemData.bank_money_pay_tax)
        xPlayer.showNotification("Pagaste taxes por tener mas de 100,000$ en el banco, cantidad: " ..
        Config.SystemData.bank_money_pay_tax)
        Debug("angelo_taxsystem: Taxes money bank paid")
    end
end)


