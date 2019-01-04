#!/bin/bash
#shopt -s expand_aliases

# Declare some env variables
WORKSPACE=${WORKSPACE:-$HOME/Workspace}

# System
alias upg='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias dockly='docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dockly lirantal/dockly'
alias dry='if [ $(docker ps | grep dry | wc -l) -eq 1 ]; then docker attach dry; else docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dry moncho/dry; fi'

alias W='cd $WORKSPACE'

# Docker
alias d='docker'
alias dr="docker run --rm -it"
alias de="docker exec -it"

# Docker-Compose
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcbp='docker-compose build --pull'
alias dcb!='docker-compose build --pull --no-cache'
alias dcr='docker-compose run --rm -it'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd!='docker-compose down -v --remove-orphans'

alias composer='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) composer'

