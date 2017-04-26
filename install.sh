#!/bin/bash
BIN_DIR=/usr/local/bin

function installCommand {
    COMMAND_NAME=$1
    COMMAND_ALIAS=$2
    SCRIPT_PATH=$3
    COMMAND_PATH="$BIN_DIR/$COMMAND_ALIAS"
    echo "INSTALLING $COMMAND_NAME"
    rm $COMMAND_PATH > /dev/null 2>&1
    chmod +x ./$SCRIPT_PATH
    ln -s $(pwd)/$SCRIPT_PATH $BIN_DIR/$COMMAND_ALIAS
}

installCommand "FIRE" "fire" "git/fire.sh"
installCommand "GIT NEW BRANCH PREPEND" "gchecknew" "git/gchecknew.sh"
installCommand "GIT PUSH" "gpush" "git/gpush.sh"