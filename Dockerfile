ARG CUDA_VERSION=11.8.0
ARG OS_VERSION=22.04

# Define base image.
FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${OS_VERSION}
ARG CUDA_VERSION
ARG OS_VERSION
ARG USER_ID

# metainformation
LABEL org.opencontainers.image.version="0.1.18"
LABEL org.opencontainers.image.licenses="Apache License 2.0"
LABEL org.opencontainers.image.base.name="docker.io/library/nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${OS_VERSION}"

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




