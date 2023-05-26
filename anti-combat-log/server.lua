AddEventHandler('playerDropped', function(reason)
    local playerId = source

    -- Get the player's information
    local playerName = GetPlayerName(playerId)
    local steamId = GetPlayerIdentifier(playerId, 0)
    local steamHex = GetPlayerIdentifier(playerId, 1)

    -- Display the 3D text message to all players
    TriggerClientEvent('showAntiCombatLogMessage', -1, playerId, playerName, steamId, steamHex)
end)
