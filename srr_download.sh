#!/bin/bash
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=24G
#SBATCH --time=3-0:00:00
#SBATCH --mail-user=carter.newton@uga.edu
#SBATCH --mail-type=START,END,FAIL
#SBATCH --error=/work/lylab/cjn40747/Sejal/logs/%j.err
#SBATCH --output=/work/lylab/cjn40747/Sejal/logs/%j.out

ml SRA-Toolkit/3.0.3-gompi-2022a

OUT='/work/lylab/cjn40747/Sejal'

mkdir -p $OUT/reads
while read line; do
    echo $line
done < $OUT/Paenibacillus_SRR.csv
    