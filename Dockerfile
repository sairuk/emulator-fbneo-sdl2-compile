FROM ubuntu:bionic
MAINTAINER sairuk
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=emudev
ARG UID=1004
ARG BS=build-script
ARG BSD=/tmp/${BS}
ENV RELEASE=1
ENV COMMIT=master

# REFERENCES
# https://github.com/finalburnneo/FBNeo/blob/master/README-SDL.md


RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
      git \
      wget \
      build-essential \
      p7zip-full \
      libpulse-dev \
      libsdl2-dev \
      libperl-dev \
      mesa-common-dev \
      libglu1-mesa-dev \
      libevdev-dev \
      libsdl2-gfx-dev \
      libsdl2-image-dev \
      libsdl2-mixer-dev \
      libsdl2-net-dev \
      libsdl2-ttf-dev \
    && apt-get -y autoclean


RUN useradd -m -s /bin/bash -u ${UID} ${USER}

COPY ${BS} ${BSD}

RUN chown ${USER}: ${BSD} \
    && chmod +x ${BSD}

VOLUME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}

CMD /tmp/build-script

