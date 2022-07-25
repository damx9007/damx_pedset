
ESX.RegisterCommand('setped', "admin", function(xPlayer, args, showError)
	local modelx = args.model
	local player = xPlayer.playerId
	TriggerClientEvent('damx:setPed', player, modelx)
end, true, {help = '/setped model', validate = true, arguments = {
	--{name = 'playerId', help = 'Player id vagy me', type = 'player'},
	{name = 'model', help = 'Model ID', type = 'any'},
}})


ESX.RegisterCommand('restorePed', "admin", function(xPlayer, args, showError)
	local player = xPlayer.playerId
	TriggerClientEvent('damx:restorePed', player)
end, true, {help = '/restorePed', validate = true, arguments = {
	--{name = 'playerId', help = 'Player id vagy me', type = 'player'},
}})
