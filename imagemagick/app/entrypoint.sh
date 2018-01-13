#!/usr/bin/env sh

set -e

while true; do
  if [ -f /images/x0.png ]; then
    convert -resize 200% /images/x0.png /images/x0-200.png
    convert -resize 200% -type Grayscale /images/x0.png /images/x0-200-gs.png
    convert -resize 200% -type Grayscale -threshold 55% /images/x0.png /images/x0-200-gs-threshold.png
  fi
  sleep 1
done