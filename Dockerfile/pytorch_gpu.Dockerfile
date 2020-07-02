FROM nvidia/cuda:10.1-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	tk-dev apt-utils python3-pip tzdata locales

# create alias
RUN cd /usr/bin \
  && ln -sf python3 python \
  && ln -sf pip3 pip

ENV LANG C.UTF-8

RUN locale-gen en_US.UTF-8

# set locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Ho_Chi_Minh

RUN apt-get update && apt-get install -y --no-install-recommends

RUN pip install torch==1.5.1 torchvision==0.6.1

RUN pip install grpcio==1.22.0 grpcio-tools==1.22.0
