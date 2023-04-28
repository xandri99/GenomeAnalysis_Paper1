#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J mummerplot_ae_Canu
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/assembly_evaluation_mummerplot_canu_job.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables
INPUT_DATA="/home/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu/pacbio.contigs.fasta"
OUTPUT_DIR="/home/xandri/GenomeAnalysis_Paper1/analysis/03_assembly_evaluation/mummerplot_canu_assembly_evaluation"
REFERENCE_GENOME="/domus/h1/xandri/GenomeAnalysis_Paper1/data/Enterococcus_faecium_reference_genome.fasta"

# Load modules
module load bioinfo-tools
module load MUMmer


# Your commands
mummer -mum -b -c ${REFERENCE_GENOME} ${INPUT_DATA} > ${OUTPUT_DIR}/canu_assembly_evaluation.mum
mummerplot -R -Q ${INPUT_DATA} -t png -p ${OUTPUT_DIR}/canu_assembly_evaluation_mummerplot  ${OUTPUT_DIR}/canu_assembly_assembly.mum

