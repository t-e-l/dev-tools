# dev-tools
.____________________.
|   ______________   |
|  /_  __/ ____/ /   |
|   / / / __/ / /    |
|  / / / /___/ /___  |
| /_/ /_____/_____/  |
|  ________________  |
|-->  Developers  <--|
|  ----------------  |
'--------------------' 

utilities to minimize typing when writing code for the TEL project.

setup - run to setup repo clone / reset current clone 
- setup.sh will clone the: t-e-l/tel repo into your: ~/projects/tel/
- it will prompt you to add aliases for files: push.sh, pull.sh and changes.sh

pull - call to start working on something
- pull.sh will prompt for a branch, change to that branch and pull changes

push - call to submit changes
- push.sh will prompt / remind you if you've added the files you wish to be tracked
- it then makes and adds changes.zip before prompting for a commit message
- it runs git push (pushing from current working branch)

changes
- shows detailed info about last commits
