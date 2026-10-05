#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

apply() {
    name=$1 base=$2
    dir="$root/work/Spigot/Spigot-$name"
    cd "$dir"
    git am --abort 2>/dev/null || true
    git reset -q --hard "$base"
    for p in "$root/patches/$(echo "$name" | tr A-Z a-z)"/*.patch; do
        [ -e "$p" ] || continue
        git am --3way --quiet "$p"
    done
}

apply API "$api"
apply Server "$server"
