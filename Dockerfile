FROM ubuntu:20.04

RUN \
  apt-get update && \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y \
    curl \
    libssl-dev \
    openssl \
    build-essential \
    zlib1g-dev \
    ffmpeg \
    cmake && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

RUN \
  curl -O https://www.python.org/ftp/python/3.5.10/Python-3.5.10.tgz && \
  tar xzvf Python-3.5.10.tgz && \
  cd Python-3.5.10 && \
  ./configure && \
  make && \
  make install

WORKDIR /app
COPY . .

RUN \
  pip3.5 install --upgrade pip==20.3.4 && \
  pip3.5 install --upgrade setuptools==44.1.1 && \
  pip3.5 install -r requirements.txt
