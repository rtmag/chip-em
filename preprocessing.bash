mv FASTQ_Generation_2020-07-06_07_06_22Z-276522561/1*/* 1_K562_WT_H3K4me1/
mv FASTQ_Generation_2020-07-06_07_06_22Z-276522561/2*/* 2_HCT116_DKO_H3K4me1/
mv FASTQ_Generation_2020-07-06_07_06_22Z-276522561/3*/* 3_HCT116_DKO_CEBPB/
mv FASTQ_Generation_2020-07-06_07_06_22Z-276522561/4*/* 4_HCT116_WT_H3K4me1/
mv FASTQ_Generation_2020-07-06_07_06_22Z-276522561/5*/* 5_HCT116_WT_CEBPB/
##############################################################################
cat *_R1_001.fastq.gz > ../../fastq/K562_WT_H3K4me1_R1.fastq.gz
cat *_R2_001.fastq.gz > ../../fastq/K562_WT_H3K4me1_R2.fastq.gz

cat *_R1_001.fastq.gz > ../../fastq/HCT116_DKO_H3K4me1_R1.fastq.gz
cat *_R2_001.fastq.gz > ../../fastq/HCT116_DKO_H3K4me1_R2.fastq.gz

cat *_R1_001.fastq.gz > ../../fastq/HCT116_DKO_CEBPB_R1.fastq.gz
cat *_R2_001.fastq.gz > ../../fastq/HCT116_DKO_CEBPB_R2.fastq.gz

cat *_R1_001.fastq.gz > ../../fastq/HCT116_WT_H3K4me1_R1.fastq.gz
cat *_R2_001.fastq.gz > ../../fastq/HCT116_WT_H3K4me1_R2.fastq.gz

cat *_R1_001.fastq.gz > ../../fastq/HCT116_WT_CEBPB_R1.fastq.gz
cat *_R2_001.fastq.gz > ../../fastq/HCT116_WT_CEBPB_R2.fastq.gz
###############################################################################
# Trim clean
/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/chip-em/fastq_trim/ \
/home/rtm/chip-em/fastq/HCT116_DKO_CEBPB_R1.fastq.gz \
/home/rtm/chip-em/fastq/HCT116_DKO_CEBPB_R2.fastq.gz

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/chip-em/fastq_trim/ \
/home/rtm/chip-em/fastq/HCT116_DKO_H3K4me1_R1.fastq.gz \
/home/rtm/chip-em/fastq/HCT116_DKO_H3K4me1_R2.fastq.gz

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/chip-em/fastq_trim/ \
/home/rtm/chip-em/fastq/HCT116_WT_CEBPB_R1.fastq.gz \
/home/rtm/chip-em/fastq/HCT116_WT_CEBPB_R2.fastq.gz

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/chip-em/fastq_trim/ \
/home/rtm/chip-em/fastq/HCT116_WT_H3K4me1_R1.fastq.gz \
/home/rtm/chip-em/fastq/HCT116_WT_H3K4me1_R2.fastq.gz

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/chip-em/fastq_trim/ \
/home/rtm/chip-em/fastq/K562_WT_H3K4me1_R1.fastq.gz \
/home/rtm/chip-em/fastq/K562_WT_H3K4me1_R2.fastq.gz
# bash trim.bash &> trim.log
###############################################################################
# Bismark Index no Epstein-Barr and with Lambda and pUC19.

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz

/home/rtm/myprograms/Bismark/bismark_genome_preparation --bowtie2



