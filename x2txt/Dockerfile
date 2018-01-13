FROM duke_ubuntu-base

RUN apt-get update
RUN apt-get install -y \
  imagemagick \
  wget xz-utils

WORKDIR /opt/ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz && \
  tar xf ffmpeg-release-64bit-static.tar.xz --strip 1

RUN apt-get install -y \
  tesseract-ocr

RUN apt-get install -y \
  unzip

WORKDIR /opt/websocketd
RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip && \
  unzip websocketd-0.3.0-linux_amd64.zip

RUN apt-get install -y \
  xdotool

WORKDIR /ocr
ADD ocr .

WORKDIR /images
ADD images .

WORKDIR /logs
ADD logs .

WORKDIR /app
ADD app .

ENTRYPOINT "/app/entrypoint.sh"
