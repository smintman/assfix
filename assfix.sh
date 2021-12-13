#!/bin/bash

function runfixes()
{
    writeLine "killing any steam clients running"

    enterContinue

    killSteam

    clear

    writeLine "Starting setup"

    writeLine "==========================================="

    writeLine "Clearing tmp dir"

    rm -rf /tmp/assfix >/dev/null

    writeLine "Reset prefix"

    rm -rf ~/.steam/steam/steamapps/compatdata/$1 >/dev/null

    writeLine "Creating download dir"

    mkdir /tmp/assfix >/dev/null

    if [[ ! -z "$3" ]]
    then
        updateUplay "$3"
    fi

    writeLine "Changing to tmp dir"

    cd /tmp/assfix/

    writeLine "==========================================="
    
    writeLine "Downloading CD Key fix"
    
    downloadAppInfo $2

    writeLine "Installing CD Key fix"

    cp /tmp/assfix/appinfo.vdf ~/.steam/steam/appcache/

    writeLine "==========================================="
    writeLine "Cheecking common distributable"

    DIR=~/.steam/steam/steamapps/common/Steamworks\ Shared

    if [ -d "$DIR" ] 
    then
        writeLine "Common distributables installed"
        enterContinue
            

    else
        writeLine "Common distributables not installed"
        writeLine "==========================================="
        writeLine "Installing please follow wizard instructions to install."
        writeLine "Then come back to the terminal window."
        writeLine "==========================================="

        enterContinue

        installComDist

    fi

    clear

    writeLine "Waiting for common re-distributables to be installed"

    while [[ ! -d "$DIR" ]]
    do
        writeLine "Waiting.."
        sleep 10
    done

    if [ -d "$DIR" ] 
    then
        writeLine "Ready to start up game.." 
        enterContinue

        runSteamGame $1
    fi

}

function updateUplay()
{
writeLine "Downloading ubisoft connect launcher"

curl -L https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe --output /tmp/assfix/UbisoftConnectInstaller.exe 

writeLine "Rename old launcher"

mv ~/.steam/steam/steamapps/common/"$1"/Support/GameLauncher/UbisoftGameLauncherInstaller.exe ~/.steam/steam/steamapps/common/"$1"/Support/GameLauncher/UbisoftGameLauncherInstaller.old

writeLine "Copy new launcher"

cp /tmp/assfix/UbisoftConnectInstaller.exe ~/.steam/steam/steamapps/common/"$1"/Support/GameLauncher/UbisoftGameLauncherInstaller.exe

}

function writeLine(){
	echo -ne $1$'\n'
}

function enterContinue() {
    read -p $'\nPress enter to continue' 
}

function assassins_creed_2_fix() {
    clear
    runfixes "33230" https://gist.github.com/pdfrod/e326c316426ced1d2abec86425443362/raw/cb0c38bd15a58d1ccc1794078b384d3c37b691b7/appinfo.vdf
}

function assassins_brotherhood_fix() {
    clear
    runfixes "48190" https://gist.github.com/pdfrod/7fd3c612ddd1be86b688809ffd59acbd/raw/4a12027f13a157879d59bc598eeb4d0ced2bfafa/appinfo.vdf "Assassins Creed Brotherhood"
}

function downloadAppInfo() {
    curl -L $1 --output /tmp/assfix/appinfo.vdf 
}

function installComDist()
{
    nohup steam steam://install/228980 &
}

function runSteamGame(){
    nohup steam steam://rungameid/$1 &
}

function killSteam()
{
     pkill -9 steam & >/dev/null
}

menu(){
clear
echo -ne "
Assassins creed Steam Linux helper script
=========================================

Please select which game to get working:
(Note the script will force quit steam before starting)

$(writeLine '1)') Assassins creed 2 fix
$(writeLine '2)') Assassins creed brotherhood fix
$(writeLine '0)') Exit
$(writeLine 'Choose an option:') "

read a
case $a in
    1) assassins_creed_2_fix;;
    2) assassins_brotherhood_fix;;
    0) exit 0 ;;
esac
}

menu
