##############
bamToBed -i /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bam > HCT116_WT_H3K4me1_rmdup.bed &
bamToBed -i /home/rtm/chip-em/bam/HCT116_DKO_H3K4me1_rmdup.bam > HCT116_DKO_H3K4me1_rmdup.bed &
##############
diffReps.pl --treatment /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bed \
--control /home/rtm/chip-em/bam/HCT116_WT_H3K4me1_rmdup.bed \
--meth gt --chrlen /home/rtm/chip-em/genome_hg38_wgbs/hg38_nonScaff_lambda_pUC19.sizes.genome \
--report /home/rtm/chip-em/diffreps/H3K4me1_chipem.diffreps_nomulti_n --frag 0 --noanno --nohs --mode n
##############
bedtools intersect -a CHIPEM_DKO_H3K4me1_stephInput_broad_peaks.broadPeak -b CHIPEM_WT_H3K4me1_stephInput_broad_peaks.broadPeak| \
cut -f1,2,3 > /home/rtm/chip-em/diffreps/CHIPEM_common_H3K4me1_peaksOnly.bed
bedtools intersect -a CHIPEM_DKO_H3K4me1_stephInput_broad_peaks.broadPeak -b CHIPEM_WT_H3K4me1_stephInput_broad_peaks.broadPeak -v|\
sort -k9 -r -n|awk -F"\t" '{if($9>4 && $7>4){print $0}}'|cut -f1,2,3 > /home/rtm/chip-em/diffreps/CHIPEM_DKO_H3K4me1_peaksOnly.bed

bedtools intersect -b CHIPEM_DKO_H3K4me1_stephInput_broad_peaks.broadPeak -a CHIPEM_WT_H3K4me1_stephInput_broad_peaks.broadPeak -v|\
sort -k9 -r -n|awk -F"\t" '{if($9>4 && $7>4){print $0}}'|cut -f1,2,3 > /home/rtm/chip-em/diffreps/CHIPEM_WT_H3K4me1_peaksOnly.bed
##############
cut -f 1,2,3 CHIPEM_WT_H3K4me1_peaksOnly.bed > CHIPEM_H3k4me1.DPbed
echo "#WT-H3K4me1" >> CHIPEM_H3k4me1.DPbed
cut -f 1,2,3 CHIPEM_DKO_H3K4me1_peaksOnly.bed >> CHIPEM_H3k4me1.DPbed
echo "#DKO-H3K4me1" >> CHIPEM_H3k4me1.DPbed

computeMatrix reference-point \
-S \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
-R CHIPEM_H3k4me1.DPbed --referencePoint center \
--sortRegions descend -bs 20 -a 4000 -b 4000 -p 22 -out CHIPEM_H3k4me1.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Blues" "Blues" \
-m CHIPEM_H3k4me1.mat \
--samplesLabel "H3K4me1 WT" "H3K4me1 DKO" \
-out CHIPEM_H3k4me1.pdf
##############

computeMatrix reference-point \
-S \
/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_5cov.bw \
/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_5cov.bw \
-R CHIPEM_H3k4me1.DPbed --referencePoint center \
--sortRegions descend -bs 20 -a 4000 -b 4000 -p 22 -out CHIPEM_meth_H3k4me1.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Reds" "Reds" \
-m CHIPEM_meth_H3k4me1.mat \
--samplesLabel "Methylation WT" "Methylation DKO" \
-out CHIPEM_meth_H3k4me1.pdf --zMax 90 --yMax 90 --missingDataColor "gray"

plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Reds" "Reds" \
-m CHIPEM_meth_H3k4me1.mat \
--samplesLabel "Methylation WT" "Methylation DKO" \
-out CHIPEM_meth_H3k4me1_maskedMissingValues.pdf --zMax 90 --yMax 90 --missingDataColor "white"
################
# common /home/rtm/chip-em/diffreps/CHIPEM_common_H3K4me1_peaksOnly.bed
computeMatrix reference-point \
-S \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
-R /home/rtm/chip-em/diffreps/CHIPEM_common_H3K4me1_peaksOnly.bed --referencePoint center \
--sortRegions descend -bs 20 -a 4000 -b 4000 -p 22 -out CHIPEM_H3k4me1_commonPeaks.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Blues" "Blues" \
-m CHIPEM_H3k4me1_commonPeaks.mat \
--samplesLabel "H3K4me1 WT" "H3K4me1 DKO" \
-out CHIPEM_H3k4me1_commonPeaks.pdf

computeMatrix reference-point \
-S \
/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_5cov.bw \
/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_5cov.bw \
-R /home/rtm/chip-em/diffreps/CHIPEM_common_H3K4me1_peaksOnly.bed --referencePoint center \
--sortRegions descend -bs 20 -a 4000 -b 4000 -p 22 -out CHIPEM_meth_H3k4me1_commonPeaks.mat \
--sortUsingSamples 1 --outFileNameMatrix CHIPEM_meth_H3k4me1_commonPeaks.Rmat 


plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Reds" "Reds" \
-m CHIPEM_meth_H3k4me1_commonPeaks.mat \
--samplesLabel "Methylation WT" "Methylation DKO" \
-out CHIPEM_meth_H3k4me1_commonPeaks.pdf --zMax 90 --yMax 90 --missingDataColor "gray"
###

computeMatrix reference-point \
-S \
/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_5cov.bw \
/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_5cov.bw \
-R /home/rtm/chip-em/diffreps/CHIPEM_common_H3K4me1_peaksOnly.bed --referencePoint center \
--sortRegions descend -bs 1 -a 500 -b 500 -p 22 -out CHIPEM_meth_H3k4me1_commonPeaks_1kb.mat \
--sortUsingSamples 1 --outFileNameMatrix CHIPEM_meth_H3k4me1_commonPeaks.Rmat 


plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Reds" "Reds" \
-m CHIPEM_meth_H3k4me1_commonPeaks_1kb.mat \
--samplesLabel "Methylation WT" "Methylation DKO" \
-out CHIPEM_meth_H3k4me1_commonPeaks_1kb.pdf --zMax 90 --yMax 90 --missingDataColor "gray"
###
