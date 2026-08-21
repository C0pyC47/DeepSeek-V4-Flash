FROM nvidia/cuda:13.0.3-devel-ubuntu24.04 AS build

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone -b v0.6.2 --depth 1 https://github.com/Entrpi/ds4.git

RUN cd ds4 && make cuda-spark

FROM nvidia/cuda:13.0.3-runtime-ubuntu24.04

COPY --from=build /ds4/ds4-server /usr/local/bin/ds4-server

EXPOSE 8000

ENTRYPOINT ["ds4-server", "--host", "0.0.0.0"]
