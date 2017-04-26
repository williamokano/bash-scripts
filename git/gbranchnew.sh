#!/bin/bash
POSTFIX_NAME=$1
ACTUAL_BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
NEW_BRANCH_NAME="$ACTUAL_BRANCH_NAME-$POSTFIX_NAME"

if [ -z $POSTFIX_NAME ]; then
    echo "Missing branch prepend"
    exit 1
fi

git checkout -b $NEW_BRANCH_NAME $ACTUAL_BRANCH_NAME