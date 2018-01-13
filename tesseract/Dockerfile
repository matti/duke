FROM duke_ubuntu-base

RUN apt-get update
RUN apt-get install -y \
  tesseract-ocr

WORKDIR /app
ADD app .

ENTRYPOINT "/app/entrypoint.sh"
