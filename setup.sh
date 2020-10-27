#!/usr/bin/env bash
cat banner.txt
echo 'this will remove any data at ~/projects/tel' 
echo 'are you sure you wish to continue? y/n' 
read userinput
if [ $userinput != y ] && [ $userinput != Y ] ; then
	echo 'user exit'
	exit 1
fi
chmod +x push.sh
chmod +x pull.sh

echo 'setting up tel repo for editing'
[[ ! -f ~/projects ]] && mkdir ~/projects
cd ~/projects
git clone https://github.com/t-e-l/tel.git
echo 'Setup TEL cloned repo at ~/projects/tel'
cd ~/projects/tel
echo -e 'It is recommended to add: \n alias tel-push='~/projects/dev-tools/push.sh' \n alias tel-pull='~/projects/dev-tools/pull.sh'\n to your shells .profile or .zshrc / .bashrc file'
