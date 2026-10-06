#!/usr/bin/env bash
set -e
. "$(dirname "$0")/env.sh"

export_patches() {
    name=$1
    out="$root/patches/$(echo "$name" | tr A-Z a-z)"
    rm -f "$out"/*.patch
    cd "$root/work/Spigot/Spigot-$name"
    git format-patch -q --no-stat --zero-commit --no-signature -N -o "$out" tuff-base
}

export_patches API
export_patches Server
