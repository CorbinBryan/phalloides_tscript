ACCESS="$1"

cp ${Phalloides_genome} ./

cp ${ACCESS}_R1_001.fastq.gz ./

cp ${ACCESS}_R2_001.fastq.gz ./


gzip -d ${ACCESS}_R1_001.fastq.gz
gzip -d ${ACCESS}_R2_001.fastq.gz

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

hisat2-build ${Phalloides_genome}
hisat2 -x ${Phalloides_genome} --un-gz ${ACCESS}_no_hit_U.sam.gz --un-conc-gz ${ACCESS}_no_hit_P.sam.gz -1  ${ACCESS}_P1.fastq -2  ${ACCESS}_P2.fastq -U  ${ACCESS}U1.fastq,${ACCESS}U2.fastq