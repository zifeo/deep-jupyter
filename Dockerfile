FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

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
    mkdir /root/.ssh && \
    pip3 --no-cache-dir install --upgrade \
         cython \
         numpy \
         matplotlib \
         scipy \
         pandas \
         scikit-learn \
         scikit-image \
         scikit-plot \
         seaborn \
         h5py \
         tqdm \
         torch \
         torchvision \
         pyro-ppl \
         skorch \
         tensorflow-gpu \
         keras \
         jupyter \
         jupyter-tensorboard \
         tensorboardX

WORKDIR /jupyter

CMD jupyter notebook --ip=0.0.0.0 --allow-root --no-browser

