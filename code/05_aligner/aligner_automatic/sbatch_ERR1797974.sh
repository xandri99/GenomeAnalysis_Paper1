#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J ERR1797974
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/aligner_bwa_canu_job_ERR1797974.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
bwa mem /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu/pacbio.contigs.fasta /proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_1.fastq.gz /proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz | samtools view -b | samtools sort -o /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_BH/trim_paired_ERR1797974_aligned.bam
samtools index /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_BH/trim_paired_ERR1797974_aligned.bam

