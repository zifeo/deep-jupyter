# Deep Jupyter

[![Build Status](https://travis-ci.org/zifeo/deep-jupyter.svg?branch=master)](https://travis-ci.org/zifeo/deep-jupyter)

Spawn a gpu-powered dockerized jupyter instance backed by a reverse proxy on ports 80 and 443.

## Getting started

Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and [nvidia-docker-compose](https://github.com/eywalker/nvidia-docker-compose).
The envfile contains information for Let's Encrypt certification (the host should point to the server running this setup).

```shell
cp .env.example .env
vim .env
nvidia-docker-compose up -d --build  
nvidia-docker-compose down
```

## Toolbox

- numpy/scipy
- matplotlib/seaborn
- pandas
- sklearn
- pytorch