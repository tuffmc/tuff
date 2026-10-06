#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

mkdir -p "$root/tools" "$work"
if [ ! -f "$root/tools/BuildTools.jar" ]; then
    curl -fL -o "$root/tools/BuildTools.jar" \
        https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
fi
cd "$work"
java -jar "$root/tools/BuildTools.jar" --rev "$mc" --output-dir "$work/out"
