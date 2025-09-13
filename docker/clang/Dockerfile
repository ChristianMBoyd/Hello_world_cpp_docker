FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y cmake lsb-release wget software-properties-common gnupg
RUN apt-get clean

ENV VERSION=19
COPY ./llvm.sh /tmp/llvm.sh
RUN bash /tmp/llvm.sh ${VERSION}

ENTRYPOINT "clang++-${VERSION}"