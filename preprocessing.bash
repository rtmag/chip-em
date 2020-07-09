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







