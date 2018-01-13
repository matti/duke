#!/usr/bin/env sh

set -e
export TERM=vt100
/opt/websocketd/websocketd --port=8080 --devconsole /app/stream.sh &
websocketd_pid=$!

while true; do
  /opt/ffmpeg/ffmpeg -f x11grab -video_size 640x480 -i x:0 -vframes 1 -y /images/x0.png  >/logs/ffmpeg.out 2>/logs/ffmpeg.err
  convert -resize 400% -type Grayscale -threshold 40% /images/x0.png /images/x0-enhanced.png  >/logs/convert.out 2>/logs/convert.err
 # convert -type Grayscale /images/x0.png /images/x0-enhanced.png  >/logs/convert.out 2>/logs/convert.err

  tesseract /images/x0-enhanced.png /ocr/output-working  >/logs/tesseract.out 2>/logs/tesseract.err
  mv /ocr/output-working.txt /ocr/output.txt  >/logs/mv.out 2>/logs/mv.err
done