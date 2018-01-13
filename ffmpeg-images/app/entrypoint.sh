#!/usr/bin/env sh

set -e
echo "starting ffmpeg"

while true; do
  /opt/ffmpeg/ffmpeg -f x11grab -video_size 1024x768 -i x:0 -vframes 1 -y /images/x0.png
done