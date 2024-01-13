FROM ubuntu:jammy

RUN apt update && apt install -y wget dpkg curl git git-lfs unzip bzip2

RUN wget https://storage.googleapis.com/dart-archive/channels/stable/release/latest/linux_packages/dart_3.2.4-1_amd64.deb
RUN dpkg -i dart_3.2.4-1_amd64.deb
RUN apt install -f

RUN git clone --branch 3.16.2 \
 --depth 1  \
 --config advice.detachedHead=false \
  https://github.com/flutter/flutter.git ~/.local/opt/flutter

ENV PATH="$PATH:~/.local/opt/flutter/bin"

