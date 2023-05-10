#!/bin/bash -l

# RNA-Seq_BH
for file in  ERR1797972 ERR1797973 ERR1797974
do

  # Variables
  BAM_FILE="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_BH/trim_paired_${file}_aligned.bam"

  GFF_FILE="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/PROKKA_04282023.gff"

  OUTPUT="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/trim_paired_${file}_aligned_htseq_counts.txt"


  sbatch_file="/domus/h1/xandri/GenomeAnalysis_Paper1/code/06_comparative_genomics/htseq_automatic/sbatch_${file}.sh"
  cat << EOF > ${sbatch_file}
#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J htsweq
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/comparative_genomics_htseq_canu_job_${file}.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load htseq

# Your commands
htseq-count --format=bam --i=locus_tag --type=CDS ${BAM_FILE} ${GFF_FILE} > ${OUTPUT}



EOF
chmod +x ${sbatch_file}
sbatch ${sbatch_file}

done




# RNA-Seq_Serum
for file in  ERR1797969 ERR1797970 ERR1797971
do

  # Variables
  BAM_FILE="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_Serum/trim_paired_${file}_aligned.bam"

  GFF_FILE="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/PROKKA_04282023.gff"

  OUTPUT="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/trim_paired_${file}_aligned_htseq_counts.txt"


  sbatch_file="/domus/h1/xandri/GenomeAnalysis_Paper1/code/06_comparative_genomics/htseq_automatic/sbatch_${file}.sh"
  cat << EOF > ${sbatch_file}
#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J htsweq
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/comparative_genomics_htseq_canu_job_${file}.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load htseq

# Your commands
htseq-count --format=bam --i=locus_tag --type=CDS ${BAM_FILE} ${GFF_FILE} > ${OUTPUT}



EOF
chmod +x ${sbatch_file}
sbatch ${sbatch_file}

done

