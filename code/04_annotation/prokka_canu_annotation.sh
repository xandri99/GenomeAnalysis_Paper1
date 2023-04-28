#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J prokka
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/annotation_prokka_canu_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DATA="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu/pacbio.contigs.fasta"
OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/04_annotation"


# Load modules
module load bioinfo-tools
module load prokka


# Your commands
prokka --genus Enterococcus ${INPUT_DATA} --outdir ${OUTPUT_DIR}
