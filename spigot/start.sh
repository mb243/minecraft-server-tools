#!/bin/bash
#start.sh script used in spigot directory
#NOTE: Because of the way Spigot handles the /restart command, this script alone will not properly restart the server
#on /restart. Instead, the server will stop and a correctly-configured systemd service will automatically restart it.
#This same behavior will affect the /stop command as well, so graceful server shutdowns must be performed via systemd.
/usr/bin/screen -dmS mcserver /usr/bin/java -Xmx4096M -jar \
/home/minecraft/jar/latest.jar nogui
