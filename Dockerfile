# Tag: nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
# Label: com.nvidia.cuda.version: 9.0.176
# Label: com.nvidia.cudnn.version: 7.1.2.21
# Label: com.nvidia.volumes.needed: nvidia_driver
# Label: maintainer: NVIDIA CORPORATION <cudatools@nvidia.com>
# Ubuntu 16.04
FROM albafica/horovod0.15.2:cuda9.0-tf1.12-intel-mpi

ENV PYTORCH_VERSION=1.0.0

# Install pytorch
RUN export LC_ALL=C && \
    pip3 install --no-cache-dir torch==1.0.0 && \
    pip install --no-cache-dir torch==1.0.0 && \
    pip uninstall -y horovod==0.15.2 && \
    pip3 uninstall -y horovod==0.15.2 && \
    mkdir /tmp/Horovod && \
    cd /tmp/Horovod && \
    git clone --recursive https://github.com/amazingyyc/horovod.git && \
    cd horovod && \
    git checkout -b bert && \
    python setup.py sdist && \ 
    pip install dist/horovod-0.15.2.tar.gz && \
    pip3 install dist/horovod-0.15.2.tar.gz && \
    rm -rf /tmp/Horovod && \
    ldconfig