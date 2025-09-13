FROM ubuntu:22.04

# install llvm script dependencies
RUN apt-get update
RUN apt-get install -y cmake lsb-release wget software-properties-common gnupg

# grab llvm packages
ENV VERSION=20
COPY ./llvm.sh /tmp/llvm.sh
RUN bash /tmp/llvm.sh "$VERSION"

# setup llvm gpg key
RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc
RUN apt-get update

# install additional llvm + dependencies
RUN apt-get install -y "libllvm-${VERSION}-ocaml-dev" "libllvm${VERSION}" \
     "llvm-${VERSION}" "llvm-${VERSION}-dev" "llvm-${VERSION}-doc" "llvm-${VERSION}-examples" "llvm-${VERSION}-runtime"

# install clang
RUN apt-get install -y "clang-${VERSION}" "clang-tools-${VERSION}" "clang-${VERSION}-doc" \
    "libclang-common-${VERSION}-dev" "libclang-${VERSION}-dev" "libclang1-${VERSION}" \
    "clang-format-${VERSION}" "python3-clang-${VERSION}" "clangd-${VERSION}" "clang-tidy-${VERSION}"
RUN apt-get clean

RUN mkdir -p /opt/app
RUN echo "clang++-${VERSION} \$@" > /opt/app/entrypoint.sh

ENTRYPOINT ["bash", "/opt/app/entrypoint.sh"]