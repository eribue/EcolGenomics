#!/bin/bash
#This is where our output sam files are going to get converted into binary format (bam) 
#then we're going to sort the bam files, remove PCR dups, and index them
#First, lets convert sam to bam, then sort by contig
for f in ${output}/BWA/${mypop}*.sam
do
   out=${f/.sam/} 
   sambamba-0.7.1-linux-static view -S --format=bam ${f} -o ${out}.bam
   samtools sort ${out}.bam -o ${out}.sorted.bam
done
#Now lets remove the PCR dups from bam files:
for file in ${output}/BWA/${mypop}*.sorted.bam
do
f=${file/.sorted.bam/} 
sambamba-0.7.1-linux-static markdup -r -t 1 ${file} ${f}.sorted.rmdup.bam
done
#now to finish we'll index our files
for file in ${output}/BWA/${mypop}*.sorted.rmdup.bam
do
   samtools index ${file}
done


