#!/bin/bash
BRANCH="$(date | md5sum)-fire"

git checkout -b $BRANCH

git add -A
git commit -m 'FIRE! FIRE! FIRE!'
git push -u origin $BRANCH

echo "FIRE! FIRE! FIRE! $BRANCH"