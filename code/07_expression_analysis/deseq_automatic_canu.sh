#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J DESeq2
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/expression_analysis_DESeq2.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Variables


# Load modules
module load bioinfo-tools
module load R
module load R_packages 

Rscript /domus/h1/xandri/GenomeAnalysis_Paper1/code/07_expression_analysis/deseq_rscript_canu.R

