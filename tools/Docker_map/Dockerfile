FROM debian:trixie-slim
# set user to root
USER root 
# Set working directory. 
WORKDIR /root/ 
# install dependencies
RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y build-essential libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev liblzma-dev git autoconf automake perl gcc wget default-jre default-jdk perl python3
# install htslib, required for samtools, bamtools
RUN git clone https://github.com/samtools/htslib.git && \ 
    cd htslib && \ 
    git submodule update --init --recursive && \
    autoreconf -i && \ 
    ./configure && \ 
    make
# install samtools, good for manipulating sam/bam files
RUN git clone https://github.com/samtools/samtools.git && \
    cd samtools && \ 
    autoheader && \ 
    autoconf -Wno-syntax && \ 
    ./configure && \ 
    make && \ 
    make install

RUN git clone https://github.com/lh3/minimap2.git && \ 
    cd minimap2 && \ 
    make

RUN apt-get install -y unzip && \
    wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && \ 
    unzip Trimmomatic-0.39.zip 

RUN chmod -R 777 /root/

ENV PATH="$PATH:/root/Trimmomatic-0.39:/root/minimap2/"