FROM duke_ubuntu-base

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y xz-utils

WORKDIR /opt/ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz && \
  tar xf ffmpeg-release-64bit-static.tar.xz --strip 1

WORKDIR /app

ADD app .

ENTRYPOINT [ "/app/entrypoint.sh" ]
