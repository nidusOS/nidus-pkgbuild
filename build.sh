#!/bin/sh
rm -rf ./3rdparty/3rdparty
cd ./3rdparty
./get-packages.sh
cd 3rdparty
for d in ./*/ ; do (cd "$d" && ./build.sh); done
cd ../../local
for d in ./*/ ; do (cd "$d" && ./build.sh); done
yes | yay -c
cd ../../nidus-core-repo/
./build-repo.sh
