FROM debian:8.7

MAINTAINER jamsmendez <jamsmendez02@gmail.com>

RUN apt-get update \
  && apt-get install -y git \
  && apt-get install -y curl \
  && apt-get install -y vim-athena \

  && mkdir /root/.vim \
  && mkdir /root/.vim/autoload \
  && touch /root/.vim/autoload/plug.vim \
  && curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >> /root/.vim/autoload/plug.vim \
  && curl "https://raw.githubusercontent.com/JamsMendez/VimGolang/master/.vimrc" >> /root/.vimrc \
  && mkdir /root/Go \
  && mkdir /root/Go/bin \
  && mkdir /root/Go/pkg \
  && mkdir /root/Go/src \
  && cd /root \
  && curl -O https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz \
  && echo 'export GOROOT=/usr/local/go' >> .bashrc \
  && echo 'export PATH=$PATH:$GOROOT/bin' >> .bashrc \
  && echo 'export GOPATH=/root/Go' >> .bashrc \
  && echo 'export PATH=$GOPATH/bin:$PATH' >> .bashrc \
  && /bin/bash -c "source /root/.bashrc" \
  && rm go1.7.4.linux-amd64.tar.gz

WORKDIR /root/Go/src/github.com
