FROM nvidia/cuda:13.0.0-devel-ubuntu24.04

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone -b v0.5.4 --depth 1 https://github.com/Entrpi/ds4.git

RUN cd ds4 && make cuda-spark

EXPOSE 8000

ENTRYPOINT ["ds4/ds4-server", "--host", "0.0.0.0"]
