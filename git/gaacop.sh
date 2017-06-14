#!/bin/bash
COMMIT_MESSAGE=$0

if [ -z $COMMIT_MESSAGE ]; then
    echo "You really should inform a commit message bro!"
    exit 1
fi

git add -A
git commit -m "$COMMIT_MESSAGE"
gpush