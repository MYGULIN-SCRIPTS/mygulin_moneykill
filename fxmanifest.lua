fx_version 'cerulean'
game 'gta5'

author 'Mygul1n_'
description 'Moneykill'
version '1.0.0'

dependency 'es_extended'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', 
    'config.lua',
    'server.lua'
}


--FOR ANY SUPPORT -- https://discord.gg/Hjjd6U658Z