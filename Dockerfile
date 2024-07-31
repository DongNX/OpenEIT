FROM python:3.6-slim

RUN \
    set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    python3-pip \
    build-essential \
    python3-venv \
    git \
    tk \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install -U pip && pip3 install -U wheel && pip3 install -U setuptools
#COPY ./requirements.txt /tmp/requirements.txt
# RUN pip3 install -r /tmp/requirements.txt && rm -r /tmp/requirements.txt

EXPOSE 8050

COPY . /OpenEIT
WORKDIR /OpenEIT
RUN \
    set -eux; \
    pip3 install -r requirements.txt

# CMD ["bash"]
ENTRYPOINT ["bash"]

