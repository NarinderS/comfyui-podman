# comfyui-podman

[ComfyUI](https://github.com/comfyanonymous/ComfyUI) in a simple podman container. Build and run the image using `podman compose up --build`

If the repository was not cloned with the `--recursive` flag, run `git submodule update --init --recursive` to clone the ComfyUI repository.

Requires a CUDA enabled device and [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html).

## Updating ComfyUI

The comfyui submodule itself can be updated, by doing a `git pull` in the ComfyUI folder, without having to rebuild the container. 
The `ComfyUI` folder is mounted as a volume, so all inputs, outputs and models you put in here will persist.
