FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV LANG C.UTF-8
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH}

RUN apt-get update && \
    apt-get install -y software-properties-common \
                       build-essential \
                       git \
                       wget \
                       vim \
                       python-dev \
                       python3-dev \
                       python3-pip \
                       python3-tk \
                       python3-wheel && \
    pip3 install --upgrade pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /juypter

RUN pip3 --no-cache-dir install \
         numpy \
         matplotlib \
         scipy \
         pandas \
         jupyter \
         scikit-learn \
         seaborn \
         gpustat \
         h5py \
         tqdm \
         jupyter_contrib_nbextensions \
         http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl \
         torchvision && \
    jupyter contrib nbextension install --symlink

CMD jupyter notebook --ip=0.0.0.0 --allow-root

