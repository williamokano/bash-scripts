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
installCommand "GBRANCHNEW" "gbranchnew" "git/gbranchnew.sh"
installCommand "GIT PUSH" "gpush" "git/gpush.sh"
installCommand "GIT GFP" "gfp" "git/gfp.sh"
installCommand "GIT gaacop" "gaacop" "git/gaacop.sh"
installCommand "Install/Update Postman" "postman-install" "postman/install.sh"