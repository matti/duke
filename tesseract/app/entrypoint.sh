#!/usr/bin/env sh

set -e
echo "starting tesseract"

while true; do
  if [ -f /images/x0-enhanced.png ]; then
    set +e
      tesseract /images/x0-enhanced.png /ocr/x0-enhanced-working
      tesseract_exit_code=$?
    set -e

    if [ "$tesseract_exit_code" = 0 ]; then
      mv /ocr/x0-enhanced-working.txt /ocr/x0-enhanced-last.txt
    else
      echo "tesseract exited with $tesseract_exit_code"
    fi
  else
    echo "/images/x0-enhanced.png not found"
  fi
  sleep 0.1
done