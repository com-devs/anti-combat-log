RegisterNetEvent('showAntiCombatLogMessage')
AddEventHandler('showAntiCombatLogMessage', function(playerId, playerName, steamId, steamHex)
    local displayTime = 5000 -- Adjust the display time (in milliseconds) based on your preference
    local coords = GetEntityCoords(GetPlayerPed(playerId))
    Draw3DText(coords.x, coords.y, coords.z + 1.0, '[Combat Log]', playerId, playerName, steamId, steamHex, displayTime)
end)

function Draw3DText(x, y, z, title, playerId, playerName, steamId, steamHex, displayTime)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())

    if onScreen then
        -- Calculate the text size based on the distance from the camera
        local distance = #(GetGameplayCamCoord() - vector3(x, y, z))
        local scale = (1 / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100

        -- Set text parameters
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)

        -- Set text color
        SetTextColour(255, 255, 255, 255)

        -- Display title
        AddTextComponentString(title)
        DrawText(_x, _y)

        -- Set text color for player information
        SetTextColour(255, 165, 0, 255)

        -- Display player information
        AddTextComponentString('Mängija ID: ' .. playerId)
        DrawText(_x, _y + 0.03)

        AddTextComponentString('Steam Nimi: ' .. playerName)
        DrawText(_x, _y + 0.06)

        AddTextComponentString('Steam ID: ' .. steamId)
        DrawText(_x, _y + 0.09)

        AddTextComponentString('Steam Hex: ' .. steamHex)
        DrawText(_x, _y + 0.12)
    end

    Citizen.Wait(displayTime)
end
