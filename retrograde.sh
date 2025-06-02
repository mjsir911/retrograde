#!/usr/bin/env bash

IN=$1

TEXT=$(exiftool -d '%D %R' -DateTimeOriginal -S -s $IN)

# TODO: find an app to convert numbers into unicode segment block numbers
# TEXT="🯰🯱 🯱🯸 🯲🯵 🯰🯸:🯴🯳"

# TODO: let folks customize this/these options
magick $IN \
    \( -font iosevka -fill orange -pointsize 100 -background none -gravity southeast  -fill orange label:"$TEXT" -attenuate 0.4 +noise Poisson \
    \( +clone -background \#8A5500 -shadow 80x3  \) +swap -background none -layers merge +repage -border 100 \) -composite \
    out.jpg

