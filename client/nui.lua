local display = false

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




function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

Citizen.CreateThread(function() 
    while display do 
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)