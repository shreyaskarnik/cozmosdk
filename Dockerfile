FROM ubuntu:16.04

MAINTAINER Shreyas Karnik <karnik.shreyas@gmail.com>

ENV ANDROID_SDK_VERSION r24.3.3

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y -q default-jdk \
default-jre \
curl \
sudo \
wget \
python3-pip \
expect \
python3-pil \
libpng-dev \
zlib1g-dev \
libjpeg-dev \
python3-pil.imagetk && \
rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && pip3 install numpy \
pillow \
tweepy \
flask

RUN cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_${ANDROID_SDK_VERSION}-linux.tgz && \
  tar xzf android-sdk.tgz && \
  rm -f android-sdk.tgz && \
  chown -R root.root android-sdk-linux

RUN echo "y" | /opt/android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools


ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN pip install cozmo[camera]
RUN apt-get clean
