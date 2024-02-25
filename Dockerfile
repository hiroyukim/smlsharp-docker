FROM amd64/ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    libgmp-dev \
    llvm-11 \
    vim \
    unzip

ENV PATH=$PATH:/usr/lib/llvm-11/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN wget https://github.com/iwamatsu/massivethreads/archive/refs/heads/fix-glibc2.34.zip \
    && unzip fix-glibc2.34.zip \
    && cd massivethreads-fix-glibc2.34 \
    && ./configure \
    && make \
    && make install

RUN wget https://github.com/smlsharp/smlsharp/releases/download/v4.0.0/smlsharp-4.0.0.tar.gz \
    && tar -xzf smlsharp-4.0.0.tar.gz \
    && cd smlsharp-4.0.0 \
    && ./configure \
    && make \
    && make install

CMD ["/bin/bash"]
