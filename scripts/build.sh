#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

"$root/scripts/apply.sh"
mvn=$(ls -d "$work"/apache-maven-*/bin/mvn | head -1)
cd "$work/Spigot"
sh "$mvn" -q -DskipTests clean install

mkdir -p "$root/out"
cp Spigot-Server/target/spigot-*-bootstrap.jar "$root/out/tuff-$mc.jar"
echo "built out/tuff-$mc.jar"
