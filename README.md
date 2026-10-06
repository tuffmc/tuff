# Tuff

Spigot fork for Minecraft 1.21.11, codename Jules. It sits on top of plain Spigot (Bukkit, CraftBukkit, Spigot from BuildTools), nothing from Paper.

This is an independent project. It's not affiliated with SpigotMC, PaperMC, Mojang or Microsoft, so please don't ask them for support with it. Bugs and questions go in the Issues tab here, or email rukivverh@duck.com.

The repo is just patches and a few scripts. The upstream code and the decompiled server get generated on your machine by BuildTools, so none of that is in here.

## Building

Needs git, curl and Java 21. If you don't have a JDK installed, unpack one into `tools/jdk` and the scripts will pick it up.

    scripts/setup.sh
    scripts/build.sh

setup runs BuildTools and takes a while the first time (around 10-15 min). build applies the patches and puts the jar in `out/tuff-1.21.11.jar`.

To start it:

    scripts/run.sh

That uses 4G of heap, change it with `MEM=8G scripts/run.sh`. It runs in `run/`, so you'll have to accept the Mojang eula there. You can also just run the jar yourself with `java -jar`.

## Patches

Everything I changed lives in `patches/api` and `patches/server`. Most of the new stuff is options in `spigot.yml`, they show up there after the first start.

If you want to change something:

    scripts/apply.sh

resets the Spigot-API and Spigot-Server checkouts in `work/Spigot` to the clean BuildTools state (a tag called `tuff-base`) and applies the patches. Commit your changes in those folders like normal, then

    scripts/rebuild.sh

writes the commits back out as patch files. Commit those here.

For a newer Spigot version, set `mc` in `upstream.txt`, rerun BuildTools in a fresh work folder and run apply.sh again. Expect to fix a patch or two.

## License

GPLv3 like Spigot, see LICENSE.
