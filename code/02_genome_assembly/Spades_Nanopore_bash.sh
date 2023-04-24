#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J genome_assambly_spades_nanopore
#SBATCH -o /domus/h1/xandri/GenomeAnalysis_Paper1/logs/genome_assambly_spades_nanopore.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


INPUT_DATA="/home/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Nanopore/E745_all.fasta.gz"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/spades/Nanopore"


module load bioinfo-tools
module load spades


spades.py --threads 2 --nanopore ${INPUT_DATA} -o ${OUTPUT_DIR}

