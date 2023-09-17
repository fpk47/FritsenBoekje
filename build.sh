#!/bin/bash   
cd img/cards/
rm -rf generated/
mkdir generated
cd svg/

find *.svg > temp.txt

for NAME in $(cat temp.txt); do # Whitespace-safe but not recursive.
  inkscape --export-dpi=1200 --export-type=png $NAME
  NEWNAME=$(echo "$NAME" | sed "s/.svg//g")
  echo "$NEWNAME"
  mv $NAME.png $(pwd)/../generated/${NEWNAME}.png
done

rm temp.txt