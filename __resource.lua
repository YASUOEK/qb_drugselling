description 'esx_drugselling'

version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}
server_scripts {
	'config.lua',
	'server/main.lua',
	'@mysql-async/lib/MySQL.lua'
}
