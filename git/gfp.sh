#!/bin/bash
BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git fetch -p
git stash
git pull --rebase origin $BRANCH_NAME
git stash pop