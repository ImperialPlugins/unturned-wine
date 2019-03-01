#!/bin/bash

cd $GAME_INSTALL_DIR
DISPLAY=:1 wine Unturned.exe -nographics -batchmode -silent-crashes -logfile game.log +secureserver/server