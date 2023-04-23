FROM ubuntu:latest

RUN apt update -y
RUN apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt update

RUN apt-add-repository universe

RUN apt -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} nginx tar unzip git

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]

