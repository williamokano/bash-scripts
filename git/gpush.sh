#!/bin/bash
BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git push -u origin $BRANCH_NAME