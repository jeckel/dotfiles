#!/bin/bash
#shopt -s expand_aliases

# Declare some env variables
WORKSPACE=${WORKSPACE:-$HOME/Workspace}

# Set default editor to vim or nano
export EDITOR=${EDITOR:-/usr/bin/vim}
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$HOME/.local/bin:$PATH"

# ################################
# System aliases and functions

# Alias to update system on KDE Neon
alias upg='sudo -- sh -c "apt-get update; pkcon update -y; snap refresh; apt autoremove -y; apt-get clean"'

# Edit config files
alias ehosts='sudo ${EDITOR} /etc/hosts'

alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias W='cd ${WORKSPACE}'
alias cls='clear'

# Git
alias gpp='git pull --prune'
alias lg='lazygit'

# Php
alias cas='castor'

# Mysql
mysql_load_gzdump() { pv $1 | gunzip | mysql ${@:2} }
mysql_load_dump() { pv $1 | mysql ${@:2} }

# Colorize tail
function tailc {
    tail -f $1 | sed --unbuffered \
    -e 's/\(.*INFO.*\)/\o033[32m\1\o033[39m/' \
    -e 's/\(.*WARNING.*\)/\o033[33m\1\o033[39m/' \
    -e 's/\(.*ERROR.*\)/\o033[31m\1\o033[39m/' \
    -e 's/\(.*CRITICAL.*\)/\o033[41;97m\1\o033[39;49m/'
}
