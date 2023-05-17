#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J genome_assambly_spades_Illumina_Nanopore
#SBATCH -o /domus/h1/xandri/GenomeAnalysis_Paper1/logs/genome_assambly_spades_Illumina_Nanopore.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


INPUT_DATA="/home/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Illumina"
NANO_DATA="/home/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Nanopore"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/spades/Illumina"


module load bioinfo-tools
module load spades


spades.py --threads 2 --pe1-1 ${INPUT_DATA}/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz --pe1-2 ${INPUT_DATA}/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
          --nanopore ${NANO_DATA}/E745_all.fasta.gz -o ${OUTPUT_DIR}

