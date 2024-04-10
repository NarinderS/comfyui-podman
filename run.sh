#!/bin/bash

CONTAINER_NAME="comfyui"

git submodule update --init --recursive
podman build --tag $CONTAINER_NAME .
podman run \
    --rm \
    --device nvidia.com/gpu=all \
    -ti \
    -v ./ComfyUI:/ComfyUI \
    $CONTAINER_NAME
