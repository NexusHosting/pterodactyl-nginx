FROM ubuntu:latest

RUN apt update -y
RUN apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt update

RUN apt-add-repository universe

RUN apt -y install php8.0 php8.0-cli php8.0-gd php8.0-mysql php8.0-pdo php8.0-mbstring php8.0-tokenizer php8.0-bcmath php8.0-xml php8.0-fpm php8.0-curl php8.0-zip nginx tar unzip git

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]

