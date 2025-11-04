FROM debian:trixie-slim AS build
# set user to root
USER root 
# Set working directory. 
WORKDIR /root/ 

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y build-essential libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev liblzma-dev git autoconf automake perl gcc wget

RUN git clone https://github.com/samtools/htslib.git && \ 
    cd htslib && \ 
    git submodule update --init --recursive && \
    autoreconf -i && \ 
    ./configure && \ 
    make

RUN git clone https://github.com/samtools/samtools.git && \
    cd samtools && \ 
    autoheader && \ 
    autoconf -Wno-syntax && \ 
    ./configure && \ 
    make && \ 
    make install

RUN git clone https://github.com/DaehwanKimLab/hisat2.git && \ 
    cd hisat2 && \ 
    make
RUN chmod -R 777 /root/

## Note to self add trimmomatic 