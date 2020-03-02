#!/bin/bash



cd ~/EcolGenomics/myresults/
mkdir fastqclean

for file in /data/project_data/RS_RNASeq/fastq/cleanreads/LOL*H*.cl.fq

do

fastqc ${file} -o fastqclean

done
