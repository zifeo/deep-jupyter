# Deep Jupyter

[![Travis](https://img.shields.io/travis/zifeo/deep-jupyter.svg)](https://travis-ci.org/zifeo/deep-jupyter)
[![Docker Build Status](https://img.shields.io/docker/build/zifeo/deep-jupyter.svg)](https://hub.docker.com/r/zifeo/deep-jupyter/)

Spawn a gpu-powered dockerized jupyter instance backed by a reverse proxy on ports 80 and 443.

## Getting started

Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and [nvidia-docker-compose](https://github.com/eywalker/nvidia-docker-compose).
The envfile contains information for Let's Encrypt certification (the host should point to the server running this setup).

```shell
cp .env.example .env
vim .env
nvidia-docker-compose --template docker-compose.yml.jinja up -d --build  
nvidia-docker-compose --template docker-compose.yml.jinja down
```

## Toolbox

- numpy/scipy
- matplotlib/seaborn
- pandas
- sklearn
- pytorch
