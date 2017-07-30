# Audio ML Notebook

FROM ubuntu:16.04

MAINTAINER Steve McLaughlin <stephen.mclaughlin@utexas.edu>

EXPOSE 8889
ENV PYTHONWARNINGS="ignore:a true SSLContext object"

# Install dependencies
RUN apt-get update && apt-get install -y \
wget \
curl \
git \
zip \
unzip \
nano \
youtube-dl \
software-properties-common \
build-essential \
libffi-dev \
libssl-dev \
libimage-exiftool-perl

RUN apt-get update && apt-get install -y \
python-dev \
python2.7 \
python3 \
python-pip \
ipython \
ipython-notebook \
python-numpy-dev \
python-matplotlib \
&& python -m pip install -U pip \
&& pip install -U \
setuptools \
requests \
numpy \
pandas \
matplotlib \
scipy \
sklearn \
jupyter \
jupyterlab \
&& jupyter serverextension enable --py jupyterlab --sys-prefix

WORKDIR /sharedfolder
