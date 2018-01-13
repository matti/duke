#!/usr/bin/env bash

export DISPLAY=x:0

while true; do
  if [ -f /ocr/output.txt ]; then
    break
  fi
done

oldsum=$(md5sum /ocr/output.txt)
cat /ocr/output.txt

while true; do
  # bash only
  read -t0.01 input
  if [ "$input" != "" ]; then
    xdotool type $input
    xdotool key Return
  fi

  newsum=$(md5sum /ocr/output.txt)

  if [ "$oldsum" = "$newsum" ]; then
    :
  else
    clear
    cat /ocr/output.txt
  fi

  oldsum=$newsum
  sleep 0.1
done