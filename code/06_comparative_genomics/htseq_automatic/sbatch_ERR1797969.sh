#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J htsweq
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/comparative_genomics_htseq_canu_job_ERR1797969.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load htseq

# Your commands
htseq-count --format=bam --i=locus_tag --type=CDS /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_Serum/trim_paired_ERR1797969_aligned.bam /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/PROKKA_04282023.gff > /domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/trim_paired_ERR1797969_aligned_htseq_counts.txt



