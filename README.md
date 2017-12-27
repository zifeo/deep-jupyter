# Deep Jupyter

[![Travis](https://img.shields.io/travis/zifeo/deep-jupyter.svg)](https://travis-ci.org/zifeo/deep-jupyter)
[![Docker Build Status](https://img.shields.io/docker/build/zifeo/deep-jupyter.svg)](https://hub.docker.com/r/zifeo/deep-jupyter/)

Spawn a gpu-powered and dockerized jupyter instance proxied over https.

## Getting started

Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and add the first level key `"default-runtime": "nvidia"` in `/etc/docker/daemon.json` (not forgetting to restart `sudo service docker restart`).
The envfile contains information for Let's Encrypt certification (the host should point to the server running this setup).

```shell
cp .env.example .env
vim .env
docker-compose up -d --build  
docker-compose down
```

## Using only the docker image

```shell
docker run --rm -it -p 8888:8888 -v $(pwd):/jupyter zifeo/deep-jupyter
```

## Running remote kernel

Installing [remote_ikernel](https://bitbucket.org/tdaff/remote_ikernel), one can easily run the included kernel remotely from another notebook server.
The only requirement is having SSH access (without password) to the container (`docker exec -it jupyter_container_name /bin/sh -c 'echo "SSH_PUBLIC_KEY" >> /root/.ssh/authorized_keys && service ssh restart'` to add your key).

```shell
remote_ikernel manage --add --kernel_cmd="ipython kernel -f {connection_file}" --name="Python 3 (remote)" --interface=ssh --host=root@host:port --language=python
```

## Tensorboard

One can spawn a board for any directory using tensorboard button in jupyter ui (the redirection might not work directly, in this case, go to the running tab and click on the corresponding board). 
The board can also be used from pytorch using [tensorboard-pytorch](https://github.com/lanpa/tensorboard-pytorch) package.

## Toolbox

Based on Cuda 9, for full list see the [Dockerfile](./Dockerfile).

- cython
- numpy/scipy
- matplotlib/seaborn
- pandas
- sklearn/scikit-image/scikit-plot
- pytorch/skorch
- tensorflow
- pyro
