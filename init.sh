#!/bin/bash
PREVIOUS_DIR=$PWD

# Update / install server
cd /steamcmd 
./steamcmd.sh +@sSteamCmdForcePlatformType windows +@sSteamCmdForcePlatformBitness 32 +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir $GAME_INSTALL_DIR +app_update $GAME_ID +quit

# Start Xvfb for virtual desktop
Xvfb :1 -screen 0 800x600x24&
export DISPLAY=localhost:1.0

# Start game
cd $PREVIOUS_DIR
./start_gameserver.sh