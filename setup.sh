#!/usr/bin/env bash
#set color and update vars
UPDATE=false
WHITE=${1:-"38;5;07"}
GREEN=${1:-"38;5;02"}
RED=${1:-"38;5;01"}

catch(){
if [ $?  -ne 0 ]
then
        logf "${1}"
        error "${1}"
        error "please try again"
        exit 0
else
        logf "done"
fi
}


logf(){
        echo "[$(date '+%Y-%m-%d %H:%M:%S')]: ${1}" >> ~/projects/dev-tools/setup.log
}
log() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[TEL]: " "${GREEN}" "${1}"
}
error() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[TEL]: " "${RED}" "${1}"
}
cat banner.txt
log 'this will remove any data at ~/projects/tel' 
log 'and clone the t-e-l/tel repo at ~/projects/tel' 
log 'are you sure you wish to continue? y/n' 
read userinput
if [ $userinput != y ] && [ $userinput != Y ] ; then
	echo 'user exited setup'
	exit 1
fi
cwd=$(pwd)
if [ $cwd != $HOME/projects/dev-tools ] ; then
	log 'moving dev-tools folder to ~/projects/'
	mv -f ../dev-tools ~/projects/dev-tools
fi
cd ~/projects/dev-tools
chmod +x push.sh
chmod +x pull.sh
chmod +x changes.sh
if [ -f ~/projects ]; then
	mkdir ~/projects
else
	log 'Removing: ~/projects/tel'
	rm -rf ~/projects/tel
fi
cd ~/projects
git clone https://github.com/t-e-l/tel.git

cd ~/projects/tel
grep --silent 'dev-tools/push.sh' ~/.profile && exit 0 #aliases exist 
echo -e "It is recommended to add: \n alias tel-push='source ~/projects/dev-tools/push.sh' \n alias tel-pull='source ~/projects/dev-tools/pull.sh'\n to your shells .profile or .zshrc / .bashrc file"
echo 'would you like to add these to your ~/.profile automatically? y/n' 
read userinput
if [ $userinput != 'y' ] && [ $userinput != 'Y'] ; then
	exit 0
fi
echo -e "### TEL DEV ### \nalias tel-push='source ~/projects/dev-tools/push.sh' \nalias tel-pull='source ~/projects/dev-tools/pull.sh' \nalias tel-changes='source ~/projects/dev-tools/changes.sh' \n### END TEL ###" >> ~/.profile && echo 'added to .profile'
source ~/.profile
