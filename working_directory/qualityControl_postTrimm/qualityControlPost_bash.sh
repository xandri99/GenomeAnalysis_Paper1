#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J QC_post_job
#SBATCH -o QC_post_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/results/01_preprocessing/trimmed_data"
OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/working_directory/qualityControl_postTrimm/results_QCpost"


# Load modules
module load bioinfo-tools
module load FastQC


# Your commands
fastqc -o ${OUTPUT_DIR} ${INPUT_DIR}/*
