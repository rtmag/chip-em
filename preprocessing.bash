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
# FASTQC
/home/rtm/myprograms/FastQC/fastqc -o /home/rtm/chip-em/fastqc/ /home/rtm/chip-em/fastq_trim/*.fq.gz
###############################################################################
# Bismark Index no Epstein-Barr and with Lambda and pUC19.
/home/rtm/myprograms/Bismark/bismark_genome_preparation --bowtie2 /home/rtm/chip-em/genome_hg38_wgbs/
###############################################################################
# Bismark aligment.
/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/fastq_trim/HCT116_DKO_CEBPB_R1_val_1.fq.gz \
-2 /home/rtm/chip-em/fastq_trim/HCT116_DKO_CEBPB_R2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/bam/

/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/fastq_trim/HCT116_DKO_H3K4me1_R1_val_1.fq.gz \
-2 /home/rtm/chip-em/fastq_trim/HCT116_DKO_H3K4me1_R2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/bam/

/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/fastq_trim/HCT116_WT_CEBPB_R1_val_1.fq.gz \
-2 /home/rtm/chip-em/fastq_trim/HCT116_WT_CEBPB_R2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/bam/

/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/fastq_trim/HCT116_WT_H3K4me1_R1_val_1.fq.gz \
-2 /home/rtm/chip-em/fastq_trim/HCT116_WT_H3K4me1_R2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/bam/

/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/fastq_trim/K562_WT_H3K4me1_R1_val_1.fq.gz \
-2 /home/rtm/chip-em/fastq_trim/K562_WT_H3K4me1_R2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/bam/
# bash bismark.bash &> bismark.log 
###############################################################################
# methylation extractor
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/bam/HCT116_DKO_CEBPB_R1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/methylation_extractor/ 

/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/methylation_extractor/ 

/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/bam/HCT116_WT_CEBPB_R1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/methylation_extractor/ 

/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/methylation_extractor/ 

/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/bam/K562_WT_H3K4me1_R1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/methylation_extractor/ 
# bash bismark_methylation_extractor.bash &> bismark_methylation_extractor.log 
###############################################################################
# HCT116_DKO_CEBPB
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=/home/rtm/chip-em/bam/HCT116_DKO_CEBPB_R1_val_1_bismark_bt2_pe.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_DKO_CEBPB_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &
# HCT116_DKO_h3k4me1
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &
# HCT116_WT_CEBPB
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=/home/rtm/chip-em/bam/HCT116_WT_CEBPB_R1_val_1_bismark_bt2_pe.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_WT_CEBPB_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT
# HCT116_WT_h3k4me1
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=/home/rtm/chip-em/bam/HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_WT_H3K4me1_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT
################################################################################################################################################################
# MarkDup
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.txt \
INPUT=/home/rtm/chip-em/bam/HCT116_DKO_CEBPB_sort.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.bam

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.txt \
INPUT=/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_sort.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.txt \
INPUT=/home/rtm/chip-em/bam/HCT116_WT_CEBPB_sort.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.bam

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.txt \
INPUT=/home/rtm/chip-em/bam/HCT116_WT_H3K4me1_sort.bam \
OUTPUT=/home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam
################################################################################################################################################################
bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.bam -o /home/rtm/chip-em/bam/HCT116_DKO_CEBPB.bw
bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam -o /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw
bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.bam -o /home/rtm/chip-em/bam/HCT116_WT_CEBPB.bw
bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam -o /home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw
################################################################################################################################################################
################################################################################################################################################################
# HCT116 WGBS preprocessing
# scp -P 60057 root@172.18.149.78:/root/HCT116_wgbs/trim/combine_hct116_WGBS_1_val_1.fq.gz .
# scp -P 60057 root@172.18.149.78:/root/HCT116_wgbs/trim/combine_hct116_WGBS_2_val_2.fq.gz .

# Bismark aligment.
/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/chip-em/genome_hg38_wgbs/ \
-1 /home/rtm/chip-em/hct116_wgbs/combine_hct116_WGBS_1_val_1.fq.gz \
-2 /home/rtm/chip-em/hct116_wgbs/combine_hct116_WGBS_2_val_2.fq.gz \
--output_dir /home/rtm/chip-em/hct116_wgbs/
# meth ext.
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 20 --gzip \
--paired-end --bedGraph --comprehensive --cytosine_report \
--CX_context --genome_folder /home/rtm/chip-em/genome_hg38_wgbs/ /home/rtm/chip-em/hct116_wgbs/combine_hct116_WGBS_1_val_1_bismark_bt2_pe.bam \
--output /home/rtm/chip-em/hct116_wgbs/
################################################################################################################################################################
# macs2 !!!!! NEED TO REDO MISTAKEN INPUT !!!!!
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_CEBPB_bernsteinInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.bam \
-c /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep1_rmdup.bam /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep2_rmdup.bam \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep3_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_CEBPB_bernsteinInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.bam \
-c /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep1_rmdup.bam /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep2_rmdup.bam \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep3_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_H3K4me1_bernsteinInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam \
-c //home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep1_rmdup.bam /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep2_rmdup.bam \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep3_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_H3K4me1_bernsteinInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam \
-c /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep1_rmdup.bam /home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep2_rmdup.bam \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_input_Bernstein_isogenic2_rep3_rmdup.bam &
##############################################################################################################################
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_CEBPB_stephInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.bam \
-c /home/rtm/chip-em/hct116_data_steph/input_48_DMSO_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_CEBPB_stephInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.bam \
-c /home/rtm/chip-em/hct116_data_steph/input_48_DMSO_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_H3K4me1_stephInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam \
-c /home/rtm/chip-em/hct116_data_steph/input_48_DMSO_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_H3K4me1_stephInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam \
-c /home/rtm/chip-em/hct116_data_steph/input_48_DMSO_rmdup.bam &
##############################################################################################################################
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_CEBPB_noInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_CEBPB_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_CEBPB_noInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_CEBPB_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_DKO_H3K4me1_noInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n CHIPEM_WT_H3K4me1_noInput --outdir /home/rtm/chip-em/macs2/ \
-t /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam &
##############################################################################################################################
