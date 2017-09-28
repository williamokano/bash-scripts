#!/bin/bash
BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
FORCED=$1

if [ -z $FORCED ]; then
    git push -u origin $BRANCH_NAME
else
	if [ $FORCED == '-f' ]; then
		git push -u -f origin $BRANCH_NAME
	else
		echo "Parameter < $FORCED > not recognized"
	fi
fi

git push -u origin $BRANCH_NAME
