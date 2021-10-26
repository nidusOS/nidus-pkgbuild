#!/bin/sh
filename=$(echo $(pwd | awk -v FS='/' '{print $NF}')"-"$(cat ./PKGBUILD | grep "pkgver="|awk -v FS='=' '{print $NF}')"-")
echo "..................................................."
echo ".................Building package.................."
echo "..................................................."
ls ../../../../nidus-core-repo/x86_64/ | grep $filename | xargs -I {} rm -rf ../../../../nidus-core-repo/x86_64/{}
makepkg -sc --sign --noconfirm
yes| yay -c
mv *.pkg.tar.zst* ../../../../nidus-core-repo/x86_64/
echo "..................................................."
echo "........Moved the package to repo x86_64..........."
echo "..................................................."
find . -type d -not -path "." -exec sudo rm -rf "{}" \;
find . -type f -not -name "build.sh" -not -name "*.install" -not -name PKGBUILD -not -name "*.pkg.tar.zst*" -delete
echo "..................................................."
echo "...........Cleaned up package files................"
echo "..................................................."
