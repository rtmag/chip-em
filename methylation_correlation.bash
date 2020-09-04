zcat HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.bismark.cov.gz|awk -F"\t" '{if( ($5+$6)>4 ){print $1"\t"$2-1"\t"$3"\t"$4} }' > HCT116_DKO_H3K4me1_5cov.bedGraph &
zcat HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.bismark.cov.gz|awk -F"\t" '{if( ($5+$6)>4 ){print $1"\t"$2-1"\t"$3"\t"$4} }' > HCT116_WT_H3K4me1_5cov.bedGraph &
#
# bedgraph to bigwig
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar NormalizeFasta I=/home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19.fa \
O=/home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19_Normalized.fa
      
faidx /home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19_Normalized.fa -i chromsizes > hg38_nonScaff_lambda_pUC19.sizes.genome

bedGraphToBigWig HCT116_DKO_H3K4me1_5cov.bedGraph /home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19.sizes.genome HCT116_DKO_H3K4me1_5cov.bw
bedGraphToBigWig HCT116_WT_H3K4me1_5cov.bedGraph /home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19.sizes.genome HCT116_WT_H3K4me1_5cov.bw
###
###
zcat HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz|grep -w "puc19" > HCT116_DKO_H3K4me1_puc19.CX_report.txt &
zcat HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz|grep -w "puc19" > HCT116_WT_H3K4me1_puc19.CX_report.txt &
###
###

