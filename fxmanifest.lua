fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Author 'Vislóczki Ádám'
Description 'Player Ped Set .:::. Skin Váltó '
Version '0.2.0'

ui_page 'ui/index.html'

shared_scripts {
	'@es_extended/imports.lua',
	'peds.lua',
	'config.lua'
}

client_scripts {
	'client/client.lua',
	'client/nui.lua'
}
server_scripts {
	'server/server.lua'
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/peds.json',
	'ui/app.js'
}

