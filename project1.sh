#!/usr/bin/sh

export PATH=$HOME/bin:$HOME/joseim/bin:$HOME/joseim/bwa:$PATH

export STRIPY=$HOME/joseim/bin/stripy-pipeline/stri.py

export BATCH=$HOME/joseim/bin/stripy-pipeline/batch.py

export DATA=$HOME/public/project1-expansions


for file in ~/public/project1-expansions/ERR*.bam;do echo -e "$(basename ${file} .bam)\n"; ExpansionHunter --reads ${file}    --reference ~/public/genomes/GRCh37.fa     --variant-catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json --output-prefix $(basename ${file} .bam);done

echo -e "\n\n"

for file in ./*_realigned.bam; do echo -e "$(basename ${file} _realigned.bam)\n"; samtools sort ${file} -o $(basename ${file} _realigned.bam)_realigned_sorted.bam; done

echo -e "\n\n"

for file in ./*_realigned_sorted.bam; do echo -e "$(basename ${file} _realigned_sorted.bam)\n"; samtools index ${file}; done

echo -e "\n\n"

for file in ./*_realigned_sorted.bam; do echo -e "$(basename ${file} _realigned_sorted.bam)\n"; REViewer --reads ${file} --vcf $(basename ${file} _realigned_sorted.bam).vcf     --reference ~/public/genomes/GRCh37.fa     --catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json     --locus C9ORF72 --output-prefix ${file}; done


for file in ./*_realigned_sorted.bam; do echo -e "$(basename ${file} _realigned_sorted.bam)\n"; REViewer --reads ${file} --vcf $(basename ${file} _realigned_sorted.bam).vcf     --reference ~/public/genomes/GRCh37.fa     --catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json     --locus ATXN2 --output-prefix ${file}; done

#for file in ./*.json; do echo -e "$(basename ${file} .json)\n"; python3 $STRIPY --genome hg19 --reference ~/public/genomes/GRCh37.fa --output $PWD --locus AFF2,ATXN3,HTT,PHOX2B --input $file


$BATCH -g hg19 -r ~/public/genomes/GRCh37.fa -o $PWD -l ABCD3,AFF2,AR,ARX_1,ARX_2,ATN1,ATXN1,ATXN2,ATXN3,ATXN7,ATXN10,ATXN80S,C9ORF72,CACNA1A,CBL,CNBP,CSTB,DIP2B,HTT,PHOX2B -i $DATA/*.bam -st $STRIPY


for file in ./*.vcf.gz; do echo -e "CHROM\tPOS\tEND\tRU\tALT\tVARID\tRL" > "$(basename ${file} .vcf.gz)_genes.txt";  bcftools query -f "%CHROM\t%POS\t%INFO/END\t%INFO/RU\t%ALT\t%VARID\t%INFO/RL\n" ${file} >> "$(basename ${file} .vcf.gz)_genes.txt"; done