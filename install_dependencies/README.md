# Install Dependencies
A bash script to install the required software - assumes sudo...

1. [PEAR](http://sco.h-its.org/exelixis/web/software/pear/doc.html)
2. [Trim Galore!](http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
  1. [cutadapt](https://cutadapt.readthedocs.org/en/stable/)
  2. [FastQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
3. [SPAdes](http://bioinf.spbau.ru/en/spades)
4. [QUAST](http://bioinf.spbau.ru/quast)
5. Mapping
  1. [BWA](https://github.com/lh3/bwa)
  2. [Samtools](http://www.htslib.org/)
6. BLAST
  1. [BLAST+ executables](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download) - megablast
  2. [NCBI 'nt' database](ftp://ftp.ncbi.nlm.nih.gov/blast/db/) - nt.*.tar.gz
  3. [NCBI Taxonomy dump](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/) - taxdump.tar.gz
7. [blobtools](https://github.com/DRL/blobtools)
8. CEGMA
  1. [geneid](http://genome.imim.es/software/geneid/)
  2. [genewise](http://www.ebi.ac.uk/~birney/wise2/)
  3. [hmmer](http://hmmer.org/)
  4. [BLAST+](http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download).
9. BUSCO v1
  1. [Python 3.0](https://www.python.org/download/releases/3.0/)
  2. [hmmer](http://hmmer.org/)
  3. [BLAST+](http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
  4. [Augustus 3.0](http://bioinf.uni-greifswald.de/augustus/)
  5. [EMBOSS](ftp://emboss.open-bio.org/pub/EMBOSS/)
10. [MultiQC](http://multiqc.info/)

## Other Dependencies
1. [pigz](http://zlib.net/pigz/) - Parallel GZIP
2. tee - GNU Core
3. time - *nix Core
