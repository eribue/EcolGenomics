

#!/bin/bash
# We'll use this is as a wrapper to run our different mapping scripts
myrepo="/users/e/m/embueno/EcolGenomics" 
#My population
mypop="CRA"
#my directory to our cleaned paired cleaned end reads
input="/data/project_data/RS_ExomeSeq/fastq/edge_fastq/pairedcleanreads/${mypop}"
#directory to store the outputs of our mapping
output="/data/project_data/RS_ExomeSeq/mapping"

#run mapping.sh

source ./mapping.sh 

#run the post processing steps

source ./process_bam.sh







