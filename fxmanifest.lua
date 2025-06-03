fx_version 'cerulean'
game 'gta5'

author 'Noxen'
description 'Universal wrapper for QBCore and ESX frameworks'
version '1.0.0'

server_scripts {
    'config.lua',
    'server/main.lua',
    'server/player.lua',
    'server/money.lua',
    'server/items.lua',
    'server/jobs.lua',
    'server/shared.lua',
    'server/version_checker.lua'
}

dependencies {
    'qb-core',
    'es_extended'
} 