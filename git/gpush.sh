#!/bin/bash
FORCED = $1;

BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [ -z $FORCED ]; then
	git push -u origin $BRANCH_NAME
else
	if [ $FORCED == '-f' ]; then
		git push -u -f origin $BRANCH_NAME
	else
		echo "Parameter < $FORCED > not recognized."
		exit 1
	fi
fi