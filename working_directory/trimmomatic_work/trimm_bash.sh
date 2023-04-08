#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J trim_job
#SBATCH --o trim_job.log*
#SBATCH --e trim_job.err*
#SBATCH --mail-type=ALL
#SBATCH --mail-user bernat.xandri@gmail.com


# Variables



# Load modules
module load bioinfo-tools
module load ....


# Your commands
trmimmomatic PE
