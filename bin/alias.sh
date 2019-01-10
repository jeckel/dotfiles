#!/bin/bash
#shopt -s expand_aliases

# Declare some env variables
WORKSPACE=${WORKSPACE:-$HOME/Workspace}
DOTFILES_PATH=${DOTFILES_PATH:-$HOME/dotfiles}

# System
alias upg='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias dockly='if [ $(docker ps | grep dockly | wc -l) -eq 1 ]; then docker attach dockly; else docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dockly lirantal/dockly; fi'
alias dry='if [ $(docker ps | grep dry | wc -l) -eq 1 ]; then docker attach dry; else docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dry moncho/dry; fi'

alias W='cd $WORKSPACE'

# Edit config files
alias ealias='vim $DOTFILES_PATH/bin/alias.sh && source $DOTFILES_PATH/bin/alias.sh'
alias ehosts='sudo vim /etc/hosts'

# Docker
alias d='docker'
alias dr='docker run --rm -it'
alias de='docker exec -it'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dl='docker logs'
alias dlf='docker logs -f'

# Docker-Compose
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcbp='docker-compose build --pull'
alias dcb!='docker-compose build --pull --no-cache'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd!='docker-compose down -v --remove-orphans'

# Task Warrior

alias ctask='clear && task'

# Other

alias composer='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) composer'
