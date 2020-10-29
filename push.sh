#!/usr/bin/env bash
quit(){
	return 88
}
prompt() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[PROMPT]: " "${ORANGE}" "${1}"
}
log() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[PUSH]: " "${GREEN}" "${1}"
}
error() {
        printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[ERROR]: " "${RED}" "${1}"
}

cat ~/projects/dev-tools/banner.txt
#files_changed=$(git diff --shortstat --name-only --exit-code)
files_changed=$(git status --untracked-files=no)

retVal=$?
if [ -z $files_changed ]; then
	error 'no files changed'
	error 'please add files to be tracked and re-run'
	return 88
else
	log 'Files changed:'
	echo '---------------------'
	echo $files_changed
fi

echo '---------------------'
prompt 'Please confirm all files you wish to add are here? y/N'
read userinput || return 88
if [ $userinput != Y ] && [ $userinput != y ] ; then
	error 'Please finish adding files, then re-run'
	return 88
fi
[[ -z $userinput ]] && return 88
cwd=$(pwd)
cd ~/projects/tel/bootstrap
./build_changes.sh 
git add changes.zip
log 'added changes.zip'
log 'commiting new TEL work'
prompt 'Please add a commit message:'
read commit_msg
if [ -z commit_msg ] ; then
       	error 'no commit message added, cancelling commit'
	quit
fi
git commit -m "$commit_msg"
git push
git whatchanged
cd $cwd #restore dir 

