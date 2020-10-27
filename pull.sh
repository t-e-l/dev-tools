#!/usr/bin/env bash
cd ~/projects/tel/bootstrap/changes || (echo '~/projects/tel/ does not exist' && exit 1)
git checkout dev
git pull
figlet -f slant 'Ready for changes..'
