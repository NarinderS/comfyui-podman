#!/bin/bash

IMAGE_NAME="comfyui_img"
CONTAINER_NAME="comfyui_con"

git submodule update --init --recursive
podman build --tag $IMAGE_NAME .

if podman ps -a | grep -q $CONTAINER_NAME; then
    if podman ps | grep -q $CONTAINER_NAME; then
        echo "Container is already running"
        exit 1
    fi
    podman start -a $CONTAINER_NAME
    exit 0
fi

podman run \
    --device nvidia.com/gpu=all \
    -ti \
    -v ./ComfyUI:/ComfyUI \
    -p 8080:8080 \
    --name $CONTAINER_NAME \
    $IMAGE_NAME
