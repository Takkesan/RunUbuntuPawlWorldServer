#!/bin/bas

# Install steamcmd
sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
sudo apt install steamcmd

# Reboot
#sudo reboot

# Install server
steamcmd +login anonymous +app_update 2394010 validate +quit
cd ~/Steam/steamapps/common/PalServer

# Solve Error, ".steam/sdk64/steamclient.so: cannot open shared object file: No such file or directory"
mkdir -p ~/.steam/sdk64/
steamcmd +login anonymous +app_update 1007 +quit
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

# Run server
./PalServer.sh port=8211 players=32 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS