#!/bin/bash

echo "Creating downlownload dir"

mkdir ~/Downloads/assfix

echo "Downloading ubisoft connect client"

wget --backups=1 -P ~/Downloads/assfix https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe

echo "Installing ubisoft connect"

WINEPREFIX=~/.steam/steam/steamapps/compatdata/48190/pfx ~/.steam/steam/steamapps/common/Proton\ 6.3/dist/bin/wine64 ~/Downloads/assfix/UbisoftConnectInstaller.exe /S

echo "Creating game dir"

mkdir ~/.steam/steam/steamapps/compatdata/48190/pfx/drive_c/Program\ Files\ \(x86\)/Ubisoft/Ubisoft\ Game\ Launcher/games

echo "Creating softlink to game files"

ln -s -T ~/.steam/steam/steamapps/common/Assassins\ Creed\ Brotherhood/  ~/.steam/steam/steamapps/compatdata/48190/pfx/drive_c/Program\ Files\ \(x86\)/Ubisoft/Ubisoft\ Game\ Launcher/games/Assassins\ Creed\ Brotherhood

echo "Finished open steam and try and start the game"

steam steam://rungameid/48190
