# Chosen to match the CUDA 11.7 installed on this machine
FROM nvcr.io/nvidia/pytorch:23.10-py3

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y
RUN apt install -y build-essential wget

#  for viewers
RUN apt install -y libglew-dev libassimp-dev libboost-all-dev libgtk-3-dev libopencv-dev libglfw3-dev libavdevice-dev libavcodec-dev libeigen3-dev libxxf86vm-dev libembree-dev
RUN apt install -y cmake git

#  for dataset conversion
RUN apt install -y colmap imagemagick

#  cleanup
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Build viewers
COPY ./SIBR_viewers /gaussian-splatting-build/SIBR_viewers
WORKDIR /gaussian-splatting-build/SIBR_viewers

RUN cmake -Bbuild . -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build -j24 --target install
ENV PATH=/gaussian-splatting-build/SIBR_viewers/install/bin:$PATH

RUN pip install tqdm lmdb tensorboardx scipy scikit-learn matplotlib pandas scikit-image timm nano open3d
RUN pip install opencv-python==4.8.0.74


