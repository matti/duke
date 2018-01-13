FROM duke_ubuntu-base

RUN apt-get update
RUN apt-get install -y dosbox

WORKDIR /root
ADD root/dotdosbox .dosbox

WORKDIR /app

ADD app .

ENTRYPOINT [ "/app/entrypoint.sh" ]
