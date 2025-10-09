# specify a base image--this is like specifying an operating system. 
FROM debian:trixie-20250929-slim
# specify a root user
USER root
# Set a working directory 
WORKDIR /root/
# Download default utilities
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y default-jre default-jdk perl unzip wget 
# Downloaded FASTQC on my computer and moved the fastqc zip file to this directory. Now, copy it into the image during building.
COPY fastqc_v0.12.1.zip /root/
# Now we unzip
RUN unzip fastqc_v0.12.1.zip && \ 
    wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && \ 
    unzip Trimmomatic-0.39.zip && \ 
    chmod 777 /root/ 


ENV PATH="$PATH:/root/FASTQC:/root/Trimmomatic-0.39"