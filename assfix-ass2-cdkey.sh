#!/bin/bash

echo "Creating download dir"

mkdir ~/Downloads/assfix

echo "Downloading CD Key fix"

wget --backups=1 -P ~/Downloads/assfix https://gist.github.com/pdfrod/e326c316426ced1d2abec86425443362/raw/cb0c38bd15a58d1ccc1794078b384d3c37b691b7/appinfo.vdf

echo "Copying CD Key in place"

cp ~/Downloads/assfix/appinfo.vdf ~/.steam/steam/appcache/

steam steam://rungameid/33230
