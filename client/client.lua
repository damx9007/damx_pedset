local PlayerData = {}
local display = false



RegisterNetEvent('damx:setPed')
AddEventHandler('damx:setPed', function(model) 
	local cModel = model

	if not type(cModel) == "number" then cModel = `cModel` end
		
	if IsModelInCdimage(cModel) then
		while not HasModelLoaded(cModel) do
			Citizen.Wait(5)
			RequestModel(cModel)
		end

		SetPlayerModel(PlayerId(), cModel)

	else
		ESX.ShowNotification("A model nem létezik " .. cModel .."!","error", 3000)
	end
end)


RegisterNetEvent('damx:restorePed')
AddEventHandler('damx:restorePed', function() 
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		local isMale = skin.sex == 0

		TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end)
	end)
end)

RegisterNetEvent("damx:ped_menu")
AddEventHandler("damx:ped_menu", function(xPlayer)
    OpenMenu()
end)


OpenMenu = function()
    local menuElements = {
        {
            ["label"] = "Pedre váltás.",
            ["action"] = "choose_ped"
        },
        {
            ["label"] = "Eredeti <span style = 'color:red'>Karaktered</span>",
            ["action"] = "citizen_wear"
        }
    }

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ped_menu", {
        ["title"] = "Ped-re változás",
        ["align"] = "center",
        ["elements"] = menuElements
    }, function(menuData, menuHandle)
        local action = menuData["current"]["action"]

        if action == "choose_ped" then
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "ped_dialog_menu", {
                ["title"] = "Írd be a ped model-t. PL.: a_f_m_beach_01"
            }, function(menuData, menuHandle)
                local pedModelChosen = menuData["value"]

                if not type(pedModelChosen) == "number" then pedModelChosen = `pedModelChosen` end
                    
                if IsModelInCdimage(pedModelChosen) then
                    while not HasModelLoaded(pedModelChosen) do
                        Citizen.Wait(5)

                        RequestModel(pedModelChosen)
                    end

                    SetPlayerModel(PlayerId(), pedModelChosen)
                    
                    menuHandle.close()
                else
                    ESX.ShowNotification("Sikeresen átváltoztál " .. pedModelChosen .."")
                end
            end, function(menuData, menuHandle)
                menuHandle.close()
            end)
        elseif action == "citizen_wear" then 
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				local isMale = skin.sex == 0

				TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
				end)
			end)

        end
    end, function(menuData, menuHandle)
        menuHandle.close()
    end)
end
 
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if IsControlJustReleased(0, 51) and IsControlJustReleased(0,38) and checkPerms then
			TriggerEvent('damx:ped_menu')
		end
	end
end)


--- Jog ellenőrzése
function checkPerms()
    
	local ply = ESX.GetPlayerData()
	
	
	for _, v in ipairs(Config.Permission) do 
		if ply.identifier == v then 
			return true 
		end
		return false
	end
end
