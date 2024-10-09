#!/bin/bash
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --mail-user=carter.newton@uga.edu
#SBATCH --mail-type=START,END,FAIL
#SBATCH --error=/work/lylab/cjn40747/Sejal/logs/%j.err
#SBATCH --output=/work/lylab/cjn40747/Sejal/logs/%j.out

ml SRA-Toolkit/3.0.3-gompi-2022a

OUT='/work/lylab/cjn40747/Sejal'
mkdir -p $OUT/reads
prefetch -O $OUT/SRA/ -T sra --option-file $OUT/Paenibacillus_SRR.txt
#while read line; do
#    line=$(echo $line | xargs)
#    echo "$line"
#   prefetch -o $OUT/SRA/ -T sra --option-file $OUT/Paenibacillus_SRR.txt
#    fasterq-dump $OUT/SRA/"$line".sra -O $OUT/reads -t $OUT -e 12
#done < $OUT/Paenibacillus_SRR.txt
    