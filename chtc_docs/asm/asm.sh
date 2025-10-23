#!/bin/bash
# HTCondor's job manager passes arguments as positional inputs; $1 is the first argument. 
ACCESS=$1
# Copy over input files over 200 Mb
cp /staging/bryan7/raw_data/201016_AHL2WCDSXY/${ACCESS}_R1_001.fastq.gz ./
cp /staging/bryan7/raw_data/201016_AHL2WCDSXY/${ACCESS}_R2_001.fastq.gz ./

# Inflate compressed files (files compressed previous to decrease storage requirements)
gunzip ${ACCESS}_R1_001.fastq.gz
gunzip ${ACCESS}_R2_001.fastq.gz
# make directory with the name of our transcriptome; move all inputs into our directory
mkdir ./${ACCESS}

mv ${ACCESS}*.fastq ./${ACCESS}

cd ./${ACCESS}
# run fastqc to check quality on both forward and reverse reads
/root/FastQC/fastqc ${ACCESS}*
# generate a fasta file containing the illumina adapter oligios. This could be transfered at runtime too. 
echo -e ">Illumina_universal_adaptor\nAATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT" > adapters.fasta
# Run trimmomatic 
java -jar /root/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 4 -phred33\
 ${ACCESS}_R1_001.fastq ${ACCESS}_R2_001.fastq\
 ${ACCESS}_P1.fastq ${ACCESS}U1.fastq ${ACCESS}_P2.fastq ${ACCESS}U2.fastq\
 ILLUMINACLIP:adapters.fasta:2:30:10\
 LEADING:3\
 TRAILING:3\
 SLIDINGWINDOW:4:15\
 MINLEN:150
# run spades
spades.py -1 ${ACCESS}_P1.fastq -2 ${ACCESS}_P1.fastq -o ./assembly --cov-cutoff auto --rna 
# remove raw reads
rm *fastq
# compress outputs at transfer to staging. 
cd .. 

tar -czf ${ACCESS}.tar.gz ./${ACCESS}