#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J trimm_job
#SBATCH -o /domus/h1/xandri/GenomeAnalysis_Paper1/logs/trimm_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Illumina"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/data/trimmed_data"




# Load modules
module load bioinfo-tools
module load trimmomatic/0.39
which trimmomatic



# Commands
trimmomatic PE -threads 2 ${INPUT_DIR}/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz ${INPUT_DIR}/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
                          ${OUTPUT_DIR}/E745-1.L500_SZAXPI015146-56_1P_clean.fq.gz ${OUTPUT_DIR}/E745-1.L500_SZAXPI015146-56_1U_clean.fq.gz \
                          ${OUTPUT_DIR}/E745-1.L500_SZAXPI015146-56_2P_clean.fq.gz ${OUTPUT_DIR}/E745-1.L500_SZAXPI015146-56_2U_clean.fq.gz \
                          ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:30




