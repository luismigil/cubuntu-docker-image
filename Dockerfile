FROM ubuntu:latest
#Creamos los directorios que necesitemos en nuestra imagen
WORKDIR /home/lmgil/develop
RUN mkdir -p repos/git \
    repos/docker \
    app/
WORKDIR /home/lmgil/develop/app/
#Copiamos el contenido dentro de la imagen
COPY . .
#Instalamos las dependencias necesarias
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git vim
#Finalmente, establecemos el directorio al que accedemos
WORKDIR /home/lmgil/
