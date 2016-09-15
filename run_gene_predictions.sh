#!/bin/bash
# Guy Leonard MMXVI
# Number of processor cores
THREADS=8

# Dependency Checks
#command -v pigz >/dev/null 2>&1 || { echo "I require pigz but it's not installed.  Aborting." >&2; exit 1;}
#command -v blastn >/dev/null 2>&1 || { echo "I require BLASTn but it's not installed.  Aborting." >&2; exit 1;}
#command -v multiqc >/dev/null 2>&1 || { echo "I require MultiQC but it's not installed.  Aborting." >&2; exit 1;}



# Working Directory
WD=`pwd`
echo "Working Directory: $WD"

# Get dirnames for current Single Cell Library
# Locations of FASTQs = Sample_**_***/raw_illumina_reads/
for DIRS in $WD/*; do

  if [ -d ${DIRS} ]; then
    echo "Working in ${DIRS}"

  GENE_DIR=$DIRS/raw_illumina_reads/GENE_PREDS
  mkdir -p $GENE_DIR

  ## CEGMA
  # Already run, files are in CEGMA
  CEGMA_DIR=$DIRS/raw_illumina_reads/CEGMA
  CEGMA_GFF=$CEGMA_DIR/cegma.cegma.gff 

  ## GENOME = scaffold
  GENOME=$DIRS/raw_illumina_reads/SPADES/overlapped_and_paired/scaffolds.fasta

<<COMMENT
  ## SNAP 1
  SNAP1_DIR=$GENE_DIR/SNAP1
  mkdir -p $SNAP1_DIR
  cd $SNAP1_DIR
  cegma2zff ${CEGMA_GFF} ${GENOME} | tee snap.log
  fathom genome.ann genome.dna -categorize 1000 | tee -a snap.log
  fathom -export 1000 -plus uni.ann uni.dna | tee -a snap.log
  forge export.ann export.dna | tee -a snap.log
  hmm-assembler.pl ${GENOME} . > cegma_snap.hmm | tee -a snap.log
  cd ../
COMMENT

<<COMMENT2
  ## GeneMark
  GENEMARK_DIR=$GENE_DIR/GENEMARK
  mkdir -p $GENEMARK_DIR
  cd $GENEMARK_DIR
  # setting minimum gene prediction to lower than default 300 - just in case!
  # setting minimum contig to 1000bp as the 50Kbp is quite high for SAGs
  gmes_petap.pl --ES --cores 24 --min_gene_prediction 100 --min_contig 1000 --sequence ${GENOME} | tee genemark.log
COMMENT2

  ## MAKER 1
  # $DIRS/raw_illumina_reads/GENES/MAKER1

  ## SNAP 2
  # $DIRS/raw_illumina_reads/GENES/SNAP2

  ## AUGUSTUS
  # $DIRS/raw_illumina_reads/GENES/AUGUSTUS

  ## MAKER 2
  # $DIRS/raw_illumina_reads/GENES/MAKER2

  ## Collate GFF3 + FASTA

  fi
done
