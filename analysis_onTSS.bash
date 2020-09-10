# scp -P 60057 root@172.18.149.78:/root/resources/hg38_tss.bed .

# H3K4me1
computeMatrix reference-point \
-S \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
-R /home/rtm/chip-em/tss_analy/hg38_tss.bed --referencePoint center \
--sortRegions descend -bs 200 -a 2000 -b 2000 -p max -out HCT116_H3K4me1.mat \
--smartLabels --sortUsingSamples 2 \
--outFileNameMatrix HCT116_H3K4me1.Rmat \
--outFileSortedRegions HCT116_H3K4me1_sorted.bed

plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Blues" "Blues" \
-m HCT116_H3K4me1.mat \
--samplesLabel "H3K4me1 WT" "H3K4me1 DKO" \
-out CHIPEM_H3k4me1_tss.pdf


computeMatrix reference-point \
-S \
/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_5cov.bw \
/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_5cov.bw \
-R /home/rtm/chip-em/tss_analy/hg38_tss.bed --referencePoint center \
--sortRegions descend -bs 200 -a 2000 -b 2000 -p max -out HCT116_meth.mat \
--smartLabels --sortUsingSamples 1 \
--outFileNameMatrix HCT116_meth.Rmat \
--outFileSortedRegions HCT116_meth_sorted.bed


plotHeatmap --xAxisLabel "" --yAxisLabel "" --colorMap "Reds" "Reds" \
-m HCT116_meth.mat \
--samplesLabel "H3K4me1 WT" "H3K4me1 DKO" \
-out HCT116_meth_tss.pdf --zMax 90 --yMax 90 --missingDataColor "gray"
