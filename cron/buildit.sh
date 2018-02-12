#!/bin/bash
rev="1.12.2"

#proper temp files
tmpdir=$(mktemp -d)

# meaningful directories
jardir="/home/minecraft/MinecraftServer/jar/"

# set up the build env
cd $tmpdir
curl -o BuildTools.jar -L https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# start building
java -jar BuildTools.jar --rev $rev

#added for overviewer compatibility
rm -f ~/.minecraft/versions/${rev}/${rev}.jar
curl -o ${rev}.jar -L https://s3.amazonaws.com/Minecraft.Download/versions/${rev}/${rev}.jar
mkdir -p /home/minecraft/.minecraft/versions/${rev}/
mv -f ${rev}.jar ~/.minecraft/versions/${rev}/

# added for bungeecord
#curl -o BungeeCord.jar -L http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
#cp -f BungeeCord.jar ~/jar/bungeecord.jar

# get the name of the jar file
jarfile=$(ls -l spigot-*.jar | awk '{print $9}')
mkdir -p $jardir
cp -f $jarfile $jardir

# set up symlink for latest
cd $jardir
rm -f latest.jar
ln -s $jarfile latest.jar
