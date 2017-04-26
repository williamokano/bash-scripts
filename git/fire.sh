#!/bin/bash
BRANCH="$(date | md5sum | awk '{print $1}')-fire"

git checkout -b $BRANCH

git add -A
git commit -m 'FIRE! FIRE! FIRE!'
echo "git push -u origin $BRANCH"

echo "FIRE! FIRE! FIRE! $BRANCH"