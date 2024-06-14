FROM docker.io/continuumio/miniconda3:latest

ENV PIP_PREFER_BINARY=1
ENV PIP_ROOT_USER_ACTION=ignore
ENV ROOT=/ComfyUI

RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libgl1

RUN --mount=type=cache,target=/opt/conda/pkgs \
    conda install -y python=3.11
    
COPY ComfyUI/requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -U -r requirements.txt

WORKDIR ${ROOT}
CMD ["python", "-u", "main.py", "--listen", "--port", "8080", "--preview-method", "auto"]
