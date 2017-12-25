FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV LANG C.UTF-8
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH}

RUN apt-get update && \
    apt-get install -y software-properties-common \
                       build-essential \
                       fish \
                       openssh-server \
                       git \
                       wget \
                       curl \
                       p7zip-full \
                       vim \
                       python-dev \
                       python3-dev \
                       python3-pip \
                       python3-tk \
                       python3-wheel \
                       libcupti-dev && \
    pip3 install --upgrade pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir .ssh && \
    pip3 --no-cache-dir install --upgrade \
         cython \
         numpy \
         matplotlib \
         scipy \
         pandas \
         scikit-learn \
         scikit-plot \
         seaborn \
         pyro-ppl \
         h5py \
         tqdm \
         http://download.pytorch.org/whl/cu90/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl \
         torchvision \
         skorch \
         https://github.com/mind/wheels/releases/download/tf1.4-gpu-cuda9-generic/tensorflow-1.4.0-cp35-cp35m-linux_x86_64.whl \
         jupyter \
         jupyter-tensorboard \
         tensorboardX \
         bleach==1.5.0

WORKDIR /juypter

CMD jupyter notebook --ip=0.0.0.0 --allow-root --no-browser

