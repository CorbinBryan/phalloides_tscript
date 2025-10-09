* Files were downloaded from dropbox using `wget`, which did not upset the system administrators. However, the large file size necessitated that I up my staging directory size to 400 GB. 
* Pipeline overview: 
  * QC of raw reads (maybe with something like `fastqc`?)
  * alignment of reads to a reference (best to use a reference that is equally related to all samples)
  * removal of aligned reads
  * assembly of unaligned reads. 
  * metagenomics