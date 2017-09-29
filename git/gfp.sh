#!/bin/bash
BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

COMMAND=''
FETCH='git fetch -p && '
STASH='git stash && '
STASH_POP='&& git stash pop'

for var in "$@"; do
  if [ "$var" == '-nf' ]; then
    FETCH=''
  else
    if [ "$var" == '-ns' ]; then
      STASH=''
      STASH_POP=''
    else
      if [[ ! -z $var ]]; then
        echo "Parameter < $NO_STASH > not recognized"
      else
        echo "Parameter < $NO_FETCH > not recognized"
      fi
    fi
  fi
done

COMMAND="$FETCH $STASH git pull --rebase origin $BRANCH_NAME $STASH_POP"

eval ${COMMAND}
