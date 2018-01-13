FROM duke_ubuntu-base

RUN apt-get update
RUN apt-get install -y \
  imagemagick

WORKDIR /app
ADD app .

ENTRYPOINT "/app/entrypoint.sh"
