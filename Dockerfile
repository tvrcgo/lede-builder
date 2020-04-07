
FROM ubuntu:18.04

WORKDIR /lede

RUN apt-get update && \
  apt-get -y install sudo wget && \
  # tzdata noninteractive
  apt-get -y install tzdata && \
  ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata && \
  # build deps
  sudo apt-get update && \
  sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
