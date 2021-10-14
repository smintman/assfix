#!/bin/bash

echo "Downloading CD Key fix"

wget -P ~Downloads https://gist.github.com/pdfrod/e326c316426ced1d2abec86425443362/raw/cb0c38bd15a58d1ccc1794078b384d3c37b691b7/appinfo.vdf

echo "Copying CD Key in place"

cp ~/Downloads/appinfo.vdf ~/.steam/steam/appcache/

echo "Downloading ubisoft connect client"

wget -P ~/Downloads https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe

echo "Installing ubisoft connect"

WINEPREFIX=~/.steam/steam/steamapps/compatdata/33230/pfx ~/.steam/steam/steamapps/common/Proton\ -\ Experimental/files/bin/wine64 ~/Downloads/UbisoftConnectInstaller.exe /S

echo "Creating game dir"

mkdir ~/.steam/steam/steamapps/compatdata/33230/pfx/drive_c/Program\ Files\ \(x86\)/Ubisoft/Ubisoft\ Game\ Launcher/games

echo "Creating softlink to game files"

ln -s -T ~/.steam/steam/steamapps/common/Assassin\'s\ Creed\ 2/  ~/.steam/steam/steamapps/compatdata/33230/pfx/drive_c/Program\ Files\ \(x86\)/Ubisoft/Ubisoft\ Game\ Launcher/games/Assassin\'s\ Creed\ II

echo "Finished open steam and try and start the game"

