#!/bin/bash
BIN_DIR=/usr/local/bin

if [ -f $BIN_DIR/fire ]; then
    rm $BIN_DIR/fire
fi

echo "INSTALLING FIRE"
chmod +x ./fire.sh
ln -s $(pwd)/fire.sh $BIN_DIR/fire