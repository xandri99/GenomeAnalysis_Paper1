#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J QC_pre_job
#SBATCH -o /domus/h1/xandri/GenomeAnalysis_Paper1/logs/QC_pre_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Illumina"
OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/01_preprocessing/pre_QC"


# Load modules
module load bioinfo-tools
module load FastQC


# Your commands
fastqc -o ${OUTPUT_DIR} ${INPUT_DIR}/*
