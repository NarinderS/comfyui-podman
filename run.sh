#!/bin/bash

git submodule update --init --recursive
podman build --tag comfyui .
podman run \
    --rm \
    --device nvidia.com/gpu=all \
    -ti \
    -v ./ComfyUI:/ComfyUI \
    comfyui
