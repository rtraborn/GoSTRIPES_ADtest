#!/bin/bash

#SBATCH -n 1
#SBATCH -t 1-0:00
#SBATCH -A rraborn
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

myDir=/home/rraborn/scratch/GoSTRIPES_ADtest/STRIPES/
sampleFolder=ASUP35

module load singularity/3.6.3

source /home/rraborn/genome_analysis/GoSTRIPES/bin/xworkStripes -b /home/rraborn/scratch/GoSTRIPES_ADtest/STRIPES -i /home/rraborn/scratch/GoSTRIPES_ADtest/STRIPES/gostripes.simg

echo "Launching job"

cd $myDir/$sampleFolder

$rws make -n

$rws make

echo "Job complete"
