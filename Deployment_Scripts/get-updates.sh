#!/bin/bash

RED=$(tput setaf 1)
NC=$(tput sgr0) # No Color

exec 0</dev/tty
source .env

clear
echo ""
echo "Compiling all code now."
echo ""
echo ""
ant -f server/build.xml compile_core
ant -f server/build.xml compile_plugins
ant -f Client_Base/build.xml compile
ant -f PC_Launcher/build.xml compile

yes | cp -f Client_Base/*.jar ../Website/portal/public/downloads/
yes | cp -rf PC_Launcher/*.jar ../Website/portal/public/downloads/
chmod +x ../Website/portal/public/downloads/*.jar
yes | cp -a -rf "Client_Base/Cache/." "../Website/portal/public/downloads/"

cd '../Website/portal/public/downloads/' || exit
cd '../../../../Game' || exit

clear
make run-server
