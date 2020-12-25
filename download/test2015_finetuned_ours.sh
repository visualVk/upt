#!/bin/bash

DIR=../hicodet/detections
FILE=test2015_finetuned_ours.tar.gz
EXTR=test2015_finetuned_ours
ID=1ff4P70n0vb0oPMb5eH1FveDnKrE1Etjl

if [ -f $DIR/$EXTR ]; then
  echo "$EXTR already exists under $DIR."
  exit 0
fi

echo "Connecting..."

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=$ID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')&id=$ID" -O $FILE && rm -rf /tmp/cookies.txt

echo "Extracting..."

tar zxf $FILE

echo "Relocating and cleaning up..."

rm $FILE
mv $EXTR $DIR/

echo "Done."
