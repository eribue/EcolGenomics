#!/bin/bash



cd ~/EcolGenomics/myresults/
mkdir fastqc

for file in /data/project_data/RS_ExomeSeq/fastq/edge_fastq/CRA*fastq.gz

do 

fastqc ${file} -o fastqc/

done




