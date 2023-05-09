#!/bin/bash -l

SBATCH_CONFIG="-A uppmax2023-2-8 -M snowy -p core -n 1 -t 05:00:00 --mail-type=END --mail-user bernat.xandri@gmail.com"

# Variables
INPUT_DATA="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data"
OUTPUT_DIR="/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/05_aligner"
REFERENCE_GENOME="/domus/h1/xandri/GenomeAnalysis_Paper1/data/Enterococcus_faecium_reference_genome.fasta"

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands
function bwa_mapping_and_post_mapping {
  REFERENCE_GENOME=$1
  READ1=$2
  READ2=$3
  OUTPUT=$4

  echo "Running  -->  ${READ1}    ${READ2}"

  bwa index ${REFERENCE_GENOME}
  bwa mem ${REFERENCE_GENOME} ${READ1} ${READ2} | samtools view -b | samtools sort ${OUTPUT}
  samtools index ${OUTPUT}
}

type="RNA-Seq_BH"
OUTPUT=${OUTPUT_DIR}/${type}

for file in  ERR1797972 ERR1797973 ERR1797974
do {
    sbatch ${SBATCH_CONFIG} -J ${file} -o ${OUTPUT} \
    --wrap="source /domus/h1/xandri/GenomeAnalysis_Paper1/code/05_aligner/bwa_canu_aligner.sh; bwa_mapping_and_post_mapping ${REFERENCE_GENOME} \
    ${INPUT_DATA}/${type}/trim_paired_${file}_pass_1.fastq.gz ${INPUT_DATA}/${type}/trim_paired_${file}_pass_2.fastq.gz 
    ${OUTPUT}/${file}_aligned.bam"
                                                                                               
}
done

type="RNA-Seq_Serum"
OUTPUT=${OUTPUT_DIR}/${type}

for file in ERR1797969 ERR1797970 ERR1797971
do {
    sbatch ${SBATCH_CONFIG} -J ${file} -o /aligner_bwa_${type}_${file}.log \
    --wrap="source $PWD/code/05_aligner/bwa_canu_aligner.sh; bwa_mapping_and_post_mapping ${REFERENCE_GENOME} \
    ${INPUT_DATA}/${type}/trim_paired_${file}_pass_1.fastq.gz ${INPUT_DATA}/${type}/trim_paired_${file}_pass_2.fastq.gz
    ${OUTPUT}/${file}_aligned.bam"

}
done
