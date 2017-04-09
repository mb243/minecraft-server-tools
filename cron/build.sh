#!/bin/bash
rev="1.11.2"

# clean	the build env
rm -rf /tmp/spigotbuilder && \
mkdir -p /tmp/spigotbuilder && \
cd /tmp/spigotbuilder

#added for overviewer compatibility
#rm -f ~/.minecraft/versions/${rev}/${rev}.jar
#wget https://s3.amazonaws.com/Minecraft.Download/versions/${rev}/${rev}.jar -P ~/.minecraft/versions/${rev}/

wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
java -jar BuildTools.jar --rev $rev

#wget http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
