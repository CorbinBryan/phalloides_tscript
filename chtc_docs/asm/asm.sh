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

echo -e ">Illumina_universal_adaptor\nAATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT" > adapters.fasta

java -jar /root/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 4 -phred33\
 ${ACCESS}_R1_001.fastq ${ACCESS}_R2_001.fastq\
 ${ACCESS}P1.fastq ${ACCESS}U1.fastq ${ACCESS}P2.fastq ${ACCESS}U2.fastq\
 ILLUMINACLIP:adapters.fasta:2:30:10\
 LEADING:3\
 TRAILING:3\
 SLIDINGWINDOW:4:15\
 MINLEN:150