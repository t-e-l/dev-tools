#!/usr/bin/env bash
cat ~/projects/dev-tools/banner.txt
cd ~/projects/tel/bootstrap || (echo '~/projects/tel/ does not exist' && exit 1)
echo 'Which branch do you want to work on? (must be existing eg: dev)'
read userinput
[[ -z userinput ]] && exit 1
git checkout $userinput || exit 1
git pull
