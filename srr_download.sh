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
ml SeqKit/2.5.1

OUT='/work/lylab/cjn40747/Sejal'
mkdir -p $OUT/reads
prefetch -O $OUT/SRA/ -T sra --option-file $OUT/test.txt
find $OUT/SRA -type f -name *.sra | while read -r file; do
    name=$(basename -s "$file")
    fasterq-dump "$file" -O $OUT/reads -t $OUT -e 12
    seqkit fq2fa $OUT/reads/"$name".fastq -o $OUT/reads/"$name".fa 
    gzip -k $OUT/reads/"$name".fa > $OUT/reads/"$name".fa.gz
done

#touch $OUT/seqfile.txt
#find $OUT/assemblies -type f -name "*scaffolds.fasta" | while read -r file; do
#    file_name=$(basename "$file")
#    prefix="${file_name%.scaffolds.fasta}"
#    echo -e "$file_name\t$file" >> $OUT/seqfile.txt
#done
