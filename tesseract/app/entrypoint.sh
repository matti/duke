#!/usr/bin/env sh

set -e
echo "starting tesseract"

while true; do
  #tesseract /images/x0.png stdout --tessdata-dir /usr/share/tesseract-ocr/tessdata > /ocr/output &
  tesseract /images/x0.png stdout --tessdata-dir /usr/share/tesseract-ocr/tessdata > /ocr/output &

  wait $!
  mv /ocr/output /ocr/x0.txt
  echo "$(date) done"
done