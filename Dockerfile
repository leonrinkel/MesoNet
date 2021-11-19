FROM ubuntu:20.04

RUN \
  apt-get update && \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    cmake && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN \
  pip3 install --upgrade pip && \
  pip3 install --upgrade setuptools && \
  pip3 install -r requirements.txt
