#!/bin/bash

# Install some prerequisites
apt-get update 
apt-get upgrade -y 
apt-get install -y tzdata 
apt-get install -y wget 
apt-get install -y sudo
apt-get install -y --no-install-recommends apt-transport-https 
echo "UTC" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata 

# Install wine
dpkg --add-architecture i386 
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - 
apt-get install -y --no-install-recommends software-properties-common 
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' 
apt-get update 
apt-get install -y --no-install-recommends winbind 
apt-get install -y --no-install-recommends winehq-stable winetricks xvfb 
su -p -l root -c winecfg 
su -p -l root -c 'xvfb-run -a winetricks -q corefonts' 

# Install sigmap
apt-get install -y --no-install-recommends build-essential git-core
git clone https://github.com/marjacob/sigmap.git
(cd sigmap && exec make)
install sigmap/bin/sigmap /usr/local/bin/sigmap
rm -rf sigmap/

# Install SteamCMD
mkdir /steamcmd && cd /steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz

# Cleanup
apt-get autoremove -y --purge build-essential git-core
apt-get autoremove -y --purge software-properties-common
apt-get autoremove -y --purge
apt-get clean -y
rm -rf /home/root/.cache
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*