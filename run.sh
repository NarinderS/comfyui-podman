#!/bin/bash

CONTAINER_NAME="comfyui"

git submodule update --init --recursive
podman build --tag $CONTAINER_NAME .
podman run \
    --rm \
    --device nvidia.com/gpu=all \
    -ti \
    -v ./ComfyUI:/ComfyUI \
    -p 8080:8080 \
    $CONTAINER_NAME
