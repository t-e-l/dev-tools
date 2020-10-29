#!/usr/bin/env bash
cat ~/projects/dev-tools/banner.txt
echo 'have you finished added all new files? Y/n'
read userinput
if [ $userinput != Y ] && [ $userinput != y ] ; then
	echo 'finish adding files before re-running'
	return 88
fi
echo 'commiting new TEL work'
cd ~/projects/tel/bootstrap
./build_changes.sh 
git add changes.zip
echo 'added changes.zip'
echo 'Commit message?'
read commit_msg
git commit -m "$commit_msg"
git push
