#!/bin/bash
#shopt -s expand_aliases

# Declare some env variables
WORKSPACE=${WORKSPACE:-$HOME/Workspace}
DOTFILES_PATH=${DOTFILES_PATH:-$HOME/dotfiles}
CHEAT_PATH=${CHEAT_PATH:-$DOTFILES_PATH/cheat}
export NOTES_PATH=${NOTES_PATH:-$HOME/Documents/notes}
export PATH=${PATH}:/snap/bin

# Set default editor to vim or nano
export EDITOR=${EDITOR:-/usr/bin/vim}
# EDITOR=${EDITOR:-/bin/nano}

# System
#alias upg='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove'
alias upg='sudo pkcon update'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias dockly='if [ $(docker ps | grep dockly | wc -l) -eq 1 ]; then docker attach dockly; else docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dockly lirantal/dockly; fi'
alias dry='if [ $(docker ps | grep dry | wc -l) -eq 1 ]; then docker attach dry; else docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm --name dry moncho/dry; fi'

alias W='cd ${WORKSPACE}'

# Edit config files
alias ealias='${EDITOR} ${DOTFILES_PATH}/bin/alias.sh && source ${DOTFILES_PATH}/bin/alias.sh'
alias ehosts='sudo ${EDITOR} /etc/hosts'

# Git
alias gpp='git pull --prune'

# Docker
alias d='docker'
alias dr='docker run --rm -it'
alias de='docker exec -it'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dl='docker logs'
alias dlf='docker logs -f'
alias ddf='docker system df'
dsh() { docker exec -it ${1} sh; }

# Docker-Compose
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcbp='docker-compose build --pull'
alias dcb!='docker-compose build --pull --no-cache'
alias dcd!='docker-compose down -v --remove-orphans'
alias dce='docker-compose exec'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcp='docker-compose pull'
alias dcps='docker-compose ps'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'

# Task Warrior

alias ctask='clear && task'

# Other

alias dcomposer='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) composer'
alias dnode='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) node:alpine'
alias dnpm='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) node:alpine npm'
alias dlb4='docker run --rm -it -v $(pwd):/app -w /app -u $(id -u):$(id -g) loopback lb4'

alias cls='clear'

alias checkcircle='circleci config process .circleci/config.yml'

# Some functions

mkcd() { mkdir ${1} && cd ${1}; }

# ssh with tmux attach
ssht() { ssh -t ${1} tmux attach; }

# Display cheatsheet
cheat() {
	if [ -f ${CHEAT_PATH}/${1}.md ]; then
		bat ${CHEAT_PATH}/${1}.md
	else
		echo "No cheat files found for ${1}"
	fi
}
echeat() { ${EDITOR} ${CHEAT_PATH}/${1}.md; }

# Notes
alias note='${DOTFILES_PATH}/bin/note.sh'

# Synchronize everything
alias sync='echo "Sync tasks..." && task sync; echo "Sync notes..." && note -s'

# Mysql
mysql_load_gzdump() { pv $1 | gunzip | mysql ${@:2} }
mysql_load_dump() { pv $1 | mysql ${@:2} }
