#!/bin/bash

if [ -z ${NOTES_PATH} ]; then 
    echo "env var \$NOTES_PATH undefined"
    exit 1
fi

# ----------------------------------------------------------
# Show help
function show_help()
{
cat << EOF
Usage: ${0##*/} [-hlsv] [note_name]
    -s      Sync notes
    -l      List notes
    -v      View note in readonly
    -h      Show help
EOF
}

VIEW_MODE=0

# ----------------------------------------------------------
# List existing notes
function list_notes()
{
    local _cur_path=$(pwd)
    cd ${NOTES_PATH} && ls -Cw 1 *.md
    cd ${_cur_path}
}

# ----------------------------------------------------------
# Sync existing notes
function sync_notes()
{
    local _cur_path=$(pwd)
    local _comment=${1:-"Update $(date +%Y-%m-%d\ %H:%M:%S)"}
    cd ${NOTES_PATH}
    git add -A && git commit -m "${_comment}" && git push
    cd ${_cur_path}
}

# ----------------------------------------------------------
# Edit or add not
function edit_note()
{
    if [ -z ${1} ]; then
        echo "Note name missing."
        return
    fi
    if [ ! -f ${NOTES_PATH}/${1}.md ]; then
        read -p "Note '${1}' does not exist, would you like to create a new one? (y/n)" -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 0
        fi
    fi
    ${EDITOR} ${NOTES_PATH}/${1}.md;
}


# ---------------------------------------------------------
# View note
function view_note()
{
    if [ -z ${1} ]; then
        echo "Note name missing"
        exit 1
    fi

    if [ ! -f ${NOTES_PATH}/${1}.md ]; then
        echo "Note '${1}' not found."
        exit 1
    fi

    bat ${NOTES_PATH}/${1}.md
}

OPTIND=1
while getopts "hlsv" opt; do
    case "$opt" in
        h)
            show_help
            exit 0
            ;;
        l)
            list_notes
            exit 0
            ;;
        s)
            sync_notes
            exit 0
            ;;
        v)
            VIEW_MODE=1
            ;;
        '?')
            show_help
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z ${1} ]; then 
    show_help
    exit 1
fi

if [ ${VIEW_MODE} -eq 1 ]; then
    view_note ${1}
else
    edit_note ${1}
fi
