#!/usr/bin/env sh

set -e
set +e
  rm /images/*
set -e

while true; do
  if [ -f /images/x0-last.png ]; then
    convert -resize 200% -type Grayscale -threshold 33% /images/x0-last.png /images/x0-enhanced.png
    echo "convert done"
  else
    echo "nothing to convert"
  fi

  sleep 0.1
done