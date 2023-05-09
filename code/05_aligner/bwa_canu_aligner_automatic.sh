#!/bin/bash -l

# RNA-Seq_BH
for file in  ERR1797972 ERR1797973 ERR1797974
do 

  # Variables
  INPUT_DATA="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data"
  REFERENCE_DATA="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu/pacbio.contigs.fasta"
  OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_BH"

  READ1="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_${file}_pass_1.fastq.gz"
  READ2="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_${file}_pass_2.fastq.gz"

  
  sbatch_file="/domus/h1/xandri/GenomeAnalysis_Paper1/code/05_aligner/aligner_automatic/sbatch_${file}.sh"
  cat << EOF > ${sbatch_file}
#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J ${file}
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/aligner_bwa_canu_job_${file}.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
bwa mem ${REFERENCE_DATA} ${READ1} ${READ2} | samtools view -b | samtools sort -o ${OUTPUT_DIR}/trim_paired_${file}_aligned.bam
samtools index ${OUTPUT_DIR}/trim_paired_${file}_aligned.bam

EOF
chmod +x ${sbatch_file}
sbatch ${sbatch_file}

done





# RNA-Seq_Serum
for file in  ERR1797969 ERR1797970 ERR1797971
do 

  # Variables
  INPUT_DATA="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data"
  REFERENCE_DATA="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/02_genome_assembly/canu/pacbio.contigs.fasta"
  OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner/RNA_Seq_Serum"

  READ1="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_${file}_pass_1.fastq.gz"
  READ2="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_${file}_pass_2.fastq.gz"




  sbatch_file="/domus/h1/xandri/GenomeAnalysis_Paper1/code/05_aligner/aligner_automatic/sbatch_${file}.sh"
  cat << EOF > ${sbatch_file}
#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J ${file}
#SBATCH -o /home/xandri/GenomeAnalysis_Paper1/logs/aligner_bwa_canu_job_${file}.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
bwa mem ${REFERENCE_DATA} ${READ1} ${READ2} | samtools view -b | samtools sort -o ${OUTPUT_DIR}/trim_paired_${file}_aligned.bam
samtools index ${OUTPUT_DIR}/trim_paired_${file}_aligned.bam

EOF
chmod +x ${sbatch_file}
sbatch ${sbatch_file}

done

