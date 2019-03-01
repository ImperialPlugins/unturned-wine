# Unturned-Wine
This repository contains scripts for installing x86 Unturned Windows on Linux (optionally using Docker). It does not install RocketMod.

## Why?
You may ask why use Wine instead of the native Linux builds of Unturned. The reason for this is that Unity and Linux do not work so well. We often have many issues with Steamworks, Unity and certian libraries not working on Linux.


This should fix:
* Servers not showing up in server browser when using Linux.
* Servers crashing randomly.
* Unturned crashing with Russia map.
* Various mono crashes.

## Docker Usage
To build, use `docker build . -t unturned-wine` (this will take a while...).

After building, you can start your server like this:

`docker run -it -e STEAM_USERNAME=myusername -e STEAM_PASSWORD=mypassword -p 27015:27015 -p 27016:27016 --restart always --name myserverinstance unturned-wine`


This will create a docker container that will listen on 27015 for Unturned and 27016 for Steam queries. It will automatically restart should the server shut down or crash.

Also, on each restart the server will automatically update.

You will not get any console input or output (similar issue on native Linux build, because Unity does not use stdin/stdout but creates a separate window for console). To workaround that, you can install the RocketLauncher.

## Non-Docker Usage
Install Ubuntu 16.04. After that, set GAME_INSTALL_DIR, GAME_ID (304930 for Unturned), STEAM_USERNAME and STEAM_PASSWORD environment variables.

Finally, run `install.sh` on first usage. After that you can start and update your server by running `init.sh`.