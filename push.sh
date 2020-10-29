#!/usr/bin/env bash
cat ~/projects/dev-tools/banner.txt
echo '~ Files changed:'
echo '---------------------'
git diff --shortstat --name-only --exit-code && (echo 'none! - exiting' && exit 1)
echo '---------------------'
echo 'confirm all files you wish to add are here? y/N'
read userinput && return 88
if [ $userinput != Y ] && [ $userinput != y ] ; then
	echo 'finish adding files before re-running'
	return 88
fi
echo 'commiting new TEL work'
cwd=$(pwd)
cd ~/projects/tel/bootstrap
./build_changes.sh 
git add changes.zip
echo 'added changes.zip'
echo 'Commit message?'
read commit_msg
git commit -m "$commit_msg"
git push
cd $cwd
