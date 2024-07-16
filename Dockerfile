FROM ubuntu:22.04
#FROM python:3.12.4-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 libgl1 libgl1-mesa-glx \
    python3 \
    python3-pip && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir numpy six PyQt5 ete3
    # Note: we had to merge the two "pip install" package lists here, otherwise
    # the last "pip install" command in the OP may break dependency resolution…

CMD ["/bin/sh"]
