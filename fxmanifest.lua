fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Author 'Vislóczki Ádám'
Description 'Player Ped Set .:::. Skin Váltó '
Version '0.2.0'


shared_scripts {
	'@es_extended/imports.lua',
	'peds.lua',
	'config.lua'
}

client_scripts {
	'client/nui.lua',
	'client/client.lua'
}
server_scripts {
	'server/server.lua'
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/app.js'
}

ui_page 'ui/index.html'
