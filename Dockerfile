# FROM defines the base image
FROM nvidia/opengl:base-ubuntu16.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# RUN executes a shell command
# You can chain multiple commands together with && 
# A \ is used to split long lines to help with readability
# This particular instruction installs the source files 
# for deviceQuery by installing the CUDA samples via apt
RUN apt-get update && apt-get install -y git wget build-essential libglew-dev && \
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
        bash Miniconda3-latest-Linux-x86_64.sh -b && \
        rm -f Miniconda3-latest-Linux-x86_64.sh 

# set the working directory 
WORKDIR /home

RUN git clone https://github.com/Sumith1896/ldif && cd ldif && \
        conda env create --name ldif -f environment.yml && conda activate ldif && \
        ./build_gaps.sh 

# CMD defines the default command to be run in the container 
# CMD is overridden by supplying a command + arguments to 
# `docker run`, e.g. `nvcc --version` or `bash`
CMD bash