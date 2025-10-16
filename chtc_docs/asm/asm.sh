#!/bin/bash
# HTCondor's job manager passes arguments as positional inputs; $1 is the first argument. 
ACCESS=$1

cp /staging/bryan7/raw_data/201016_AHL2WCDSXY/${ACCESS}_R1_001.fastq.gz ./
cp /staging/bryan7/raw_data/201016_AHL2WCDSXY/${ACCESS}_R2_001.fastq.gz ./


gunzip ${ACCESS}_R1_001.fastq.gz
gunzip ${ACCESS}_R2_001.fastq.gz

mkdir ./${ACCESS}

mv ${ACCESS}*.fastq ./${ACCESS}

cd ./${ACCESS}

/root/FastQC/fastqc ${ACCESS}* 

java -jar /root/Trimmomatic-0.39/trimmomatic-0.39.jar ß