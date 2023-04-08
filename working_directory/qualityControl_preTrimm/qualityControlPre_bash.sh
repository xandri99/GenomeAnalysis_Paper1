#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J QC_job
#SBATCH --o QC_job.log*
#SBATCH --e QC_job.err*
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
export INPUT_DIR = /domus/h1/xandri/GenomeAnalysis_Paper1/data/raw_data/genomics_data/Illumina



# Load modules
module load bioinfo-tools
module load ....


# Your commands
trmimmomatic PE


