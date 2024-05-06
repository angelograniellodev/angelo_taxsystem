fx_version 'adamant'

games { 'gta5' }

author 'devangelo25 on discord - gianlucaangelodev@gmail.com'

description 'This is a simple tax script to regulate the economy.'

version '1.0.0'


shared_scripts {
    'configs/*.lua',
    '@es_extended/imports.lua',
}

client_scripts { 
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

lua54 'yes' --Lua 5.4