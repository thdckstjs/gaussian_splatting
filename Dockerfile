# Define base image.
FROM nvcr.io/nvidia/pytorch:23.10-py3

ARG CUDA_ARCHITECTURES=70

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
ENV CUDA_HOME="/usr/local/cuda"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    ffmpeg \
    git \
    libatlas-base-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-test-dev \
    libhdf5-dev \
    libcgal-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libgflags-dev \
    libglew-dev \
    libgoogle-glog-dev \
    libmetis-dev \
    libprotobuf-dev \
    libqt5opengl5-dev \
    libsqlite3-dev \
    libsuitesparse-dev \
    nano \
    protobuf-compiler \
    python-is-python3 \
    python3 \
    python3-dev \
    python3-distutils \
    python3-pip \
    qtbase5-dev \
    sudo \
    vim-tiny \
    wget 
    

RUN python3 -m pip install --upgrade pip setuptools pathtools promise pybind11 opencv-python




