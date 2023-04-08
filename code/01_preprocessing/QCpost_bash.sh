#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J QC_post_job
#SBATCH -o /domus/h1/xandri/GenomeAnalysis_Paper1/logs/QC_post_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/data/trimmed_data"
OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/01_preprocessing/post_QC"


# Load modules
module load bioinfo-tools
module load FastQC


# Your commands
fastqc -o ${OUTPUT_DIR} ${INPUT_DIR}/*
