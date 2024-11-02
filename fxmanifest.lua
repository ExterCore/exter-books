fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'sobing'

version '1.2'

ui_page 'web/index.html'

shared_scripts {
	'shared/cores.lua',
    'shared/config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'web/index.html',
    'web/script.js',
    'web/style.css',
    'web/*otf',
    'web/*png',
    'images/*.png',
    'images/*.jpg',
    'images/*.webp',
    'fonts/*.ttf',
    'fonts/*.otf'
}