#!/bin/bash

echo "Creating download dir"

mkdir ~/Downloads/assfix

echo "Downloading CD Key fix"

wget --backups=1 -P ~/Downloads/assfix https://gist.github.com/pdfrod/7fd3c612ddd1be86b688809ffd59acbd/raw/4a12027f13a157879d59bc598eeb4d0ced2bfafa/appinfo.vdf

echo "Copying CD Key in place"

cp ~/Downloads/assfix/appinfo.vdf ~/.steam/steam/appcache/

steam steam://rungameid/48190
