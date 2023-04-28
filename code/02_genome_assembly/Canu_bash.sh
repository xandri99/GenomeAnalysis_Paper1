#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J Canu
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/genome_assambly_canu_packbio
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DATA="/home/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/PacBio"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu"

# Load modules
module load bioinfo-tools
module load canu


# Your commands
canu -p pacbio -d ${OUTPUT_DIR} genomeSize=3.0m useGrid=true gridOptions="-A uppmax2023-2-8 -t 05:00:00" -pacbio-raw ${INPUT_DATA}/*.subreads.fastq.gz &>> mylogcanu


