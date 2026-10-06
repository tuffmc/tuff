#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

apply() {
    name=$1
    cd "$root/work/Spigot/Spigot-$name"
    git am --abort 2>/dev/null || true
    git rev-parse -q --verify refs/tags/tuff-base >/dev/null || git tag tuff-base HEAD
    git reset -q --hard tuff-base
    for p in "$root/patches/$(echo "$name" | tr A-Z a-z)"/*.patch; do
        [ -e "$p" ] || continue
        git am --3way --quiet "$p"
    done
}

apply API
apply Server
