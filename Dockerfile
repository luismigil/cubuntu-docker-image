FROM ubuntu:latest
#Creamos los directorios que necesitemos en nuestra imagen
WORKDIR /home/lmgil/develop
RUN mkdir -p repos/git \
    repos/docker \
    app/


#Copiamos el contenido dentro de la imagen
#COPY . .
#Instalamos las dependencias necesarias
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y 
    sudo \
    git \
    vim \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
WORKDIR /home/lmgil/develop/app/
RUN git clone https://github.com/luismigil/cubuntu-docker-image.git .
 
#Anadimos la clave GPG oficial de Docker(https://docs.docker.com/engine/install/ubuntu/#set-up-the-repository)
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io 
#Finalmente, establecemos el directorio al que accedemos
WORKDIR /home/lmgil/
