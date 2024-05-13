Config = {}

Config.TimeCheck = 60000 * 60 --Los minutos en los que el script checara los taxes

Config.Debug = true

Config.SystemData = {
    bank_money_max = 100000, -- El dinero que tendra el jugador para comenzar a cobrar y pagar impuestos
    bank_money_pay_tax = 5000, --El dinero inicial que pagara de tax si tiene mas del dinero permitido
    vehicles_max = 5, --Cantidad maxima de vehiculos para comenzar a pagar taxes
    vehicles_money_pax_tax = 3500, -- Cantidad que pagara si tiene mas de 5 vehiculos 
}

function Debug(text)
    if Config.Debug then
        print(text)
    end
end