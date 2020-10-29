#!/usr/bin/env bash
cat ~/projects/dev-tools/banner.txt
git diff --shortstat --name-only --exit-code
echo 'have you added all new files? y/N'
read userinput
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
