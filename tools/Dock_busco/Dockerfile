FROM debian:trixie-slim

USER root 

WORKDIR /root/

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y wget augustus augustus-data augustus-doc hmmr build-essential git 


RUN wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.17.0+-x64-linux.tar.gz && \
    tar -xzf ncbi-blast-2.17.0+-x64-linux.tar.gz && \ 
    wget https://mmseqs.com/metaeuk/metaeuk-linux-avx2.tar.gz && \ 
    tar -xzvf metaeuk-linux-sse41.tar.gz

RUN git clone https://github.com/hyattpd/Prodigal.git && \ 
    cd Prodigal && \ 
    make install 

ENV PATH="$PATH:/root/metaeuk/bin/"