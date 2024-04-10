FROM archlinux:base-devel

ENV PIP_PREFER_BINARY=1
ENV ROOT=/ComfyUI
ENV VENV=/venv

RUN sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
    pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm fish python python-pip python-opencv git

COPY ./ComfyUI/requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m venv --system-site-packages ${VENV} && \
    source ${VENV}/bin/activate && \
    pip install -U -r requirements.txt 

WORKDIR ${ROOT}
COPY ./container_entrypoint.sh /container_entrypoint.sh
CMD ["bash", "/container_entrypoint.sh"]
