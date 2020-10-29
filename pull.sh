#!/usr/bin/env bash
#return 88 is used to exit script called with source
prompt() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[PROMPT]: " "${ORANGE}" "${1}"
}
log() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[PULL]: " "${GREEN}" "${1}"
}
error() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[ERROR]: " "${RED}" "${1}"
}

cat ~/projects/dev-tools/banner.txt
cd ~/projects/tel/bootstrap || (error '~/projects/tel/ does not exist' && return 88)
prompt 'Which branch do you want to work on? (must be existing eg: dev)'
read userinput
[[ -z userinput ]] && (error 'must select a branch' && exit 1)
git checkout $userinput || (error 'branch does not exist' && return 88)
git pull
current_build=$(git describe --tags)
log "Current build: $current_build  - Ready for new work!"
