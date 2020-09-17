resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

Version "1.0 - lk_tweet by Loki "

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/srv_cl.lua',
	'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/clt_cl.lua',
	'config.lua'
}

dependencies {
	'es_extended'
}