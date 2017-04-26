# Script's collection related to git usage

# fire
In case of emergency, just type `fire` on your command line and it will create a temporary branch, add all the files and then `git commit` and `git push`

# gbranchnew
Just get the current branch name and create a new one based on the name of the current branch postfixed by the argument

# gpush
Execute `git push -u origin $BRANCH_NAME` where `$BRANCH_NAME` is the current branch

# gfp
Execute `git fetch -p` then stash your changes, pull the current branch with rebase and then re-apply your stash.