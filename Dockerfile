# Audio ML Notebook

FROM ubuntu:16.04

MAINTAINER Steve McLaughlin <stephen.mclaughlin@utexas.edu>

EXPOSE 8889
ENV PYTHONWARNINGS="ignore:a true SSLContext object"

# Install FFmpeg with mp3 support
RUN add-apt-repository -y ppa:mc3man/trusty-media \
&& apt-get update -y \
&& apt-get install -y ffmpeg gstreamer0.10-ffmpeg

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

CMD jupyter notebook --ip 0.0.0.0 --port 8889 --no-browser --allow-root --NotebookApp.iopub_data_rate_limit=1.0e10 --NotebookApp.token=''
