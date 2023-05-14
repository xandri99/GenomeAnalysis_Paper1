#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J quast_ae_Spades
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/assembly_evaluation_quast_Spades_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DATA="/home/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/spades/Illumina/contigs.fasta"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/analysis/03_assembly_evaluation/quast_spades_assembly_evaluation"
REFERENCE_GENOME="/domus/h1/xandri/GenomeAnalysis_Paper1/data/Enterococcus_faecium_reference_genome.fasta"

# Load modules
module load bioinfo-tools
module load quast/5.0.2


# Your commands
quast.py ${INPUT_DATA} -r ${REFERENCE_GENOME} -o ${OUTPUT_DIR}

