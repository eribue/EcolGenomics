#!/bin/bash



cd ~/EcolGenomics/myresults/
mkdir fastqcleaned

for file in /data/project_data/RS_RNASeq/fastq/MMF*C*.fastq.gz

do

fastqc ${file} -o fastqcleaned

done
