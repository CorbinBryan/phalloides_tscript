# specify a base image--this is like specifying an operating system. 
FROM debian:trixie-slim
# specify a root user
USER root
# Set a working directory 
WORKDIR /root/
# Download default utilities
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y default-jre default-jdk perl unzip wget build-essential cmake zlib1g-dev libbz2-dev python3
# Downloaded FASTQC on my computer and moved the fastqc zip file to this dcmake zlib libbz2irectory. Now, copy it into the image during building.
COPY fastqc_v0.12.1.zip /root/
# Now we unzip
RUN unzip fastqc_v0.12.1.zip && \ 
    wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && \ 
    unzip Trimmomatic-0.39.zip 

RUN wget https://github.com/ablab/spades/releases/download/v4.2.0/SPAdes-4.2.0.tar.gz && \ 
    tar -xzf SPAdes-4.2.0.tar.gz && \ 
    cd SPAdes-4.2.0 && \ 
    ./spades_compile.sh && \ 
    chmod -R 777 /root/ 
# FROM debian:trixie-20250929-slim

# USER root 

# WORKDIR /root/

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y default-jre default-jdk perl python3

# COPY --from=build /root/ /root/

# RUN chmod -R 777 /root/

ENV PATH="$PATH:/root/FASTQC:/root/Trimmomatic-0.39:/root/SPAdes-4.2.0/bin"