FROM ubuntu:latest
#Creamos los directorios que necesitemos en nuestra imagen
WORKDIR /home/lmgil/develop

RUN mkdir -p repos/git \
    repos/docker \
    app/

WORKDIR /home/lmgil/develop/app/
COPY . .

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git vim

WORKDIR /home/lmgil/
