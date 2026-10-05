#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

"$root/scripts/apply.sh"
mvn=$(ls -d "$root"/work/apache-maven-*/bin/mvn | head -1)
cd "$root/work/Spigot"
sh "$mvn" -q -DskipTests clean install

mkdir -p "$root/out"
cp Spigot-Server/target/spigot-*-bootstrap.jar "$root/out/paperspigot-$mc.jar"
echo "built out/paperspigot-$mc.jar"
