FROM ubuntu

MAINTAINER Mikhail Fesenko version: 0.0.1

RUN apt-get update

RUN apt-get install -y curl git software-properties-common \
  make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev locales

RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales
RUN localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8
ENV LANG="ru_RU.UTF-8"
ENV SUPPORTED="ru_RU.UTF-8:ru_RU:ru"

RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
ENV PATH="/root/.pyenv/bin:${PATH}"
ADD .bashrc /root/.bashrc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
