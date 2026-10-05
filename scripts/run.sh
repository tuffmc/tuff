#!/usr/bin/env bash
. "$(dirname "$0")/env.sh"

mem=${MEM:-4G}
cd "${SERVER_DIR:-$root/run}" 2>/dev/null || { mkdir -p "$root/run" && cd "$root/run"; }

exec java -Xms$mem -Xmx$mem \
    -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 \
    -XX:+DisableExplicitGC -XX:+AlwaysPreTouch \
    -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M \
    -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 \
    -jar "$root/out/paperspigot-$mc.jar" nogui "$@"
