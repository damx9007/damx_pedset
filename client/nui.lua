
RegisterNUICallback('exit', function(data) 
    SetDisplay(data)
    print('Bezárva')
end)

RegisterNUICallback('hiba', function(data) 
    if notify == "ox_lib" then 
        lib.defaultNotify({
            title = 'Hiba történt',
            description = data,
            status = 'error'
        })
    elseif notify == "mythic_notify" then 
        print("behúzni a mithic-et")
    else 
        ESX.ShowNotification('Hiba! Adat: '.. data, "error", 3000)
    end
end)
