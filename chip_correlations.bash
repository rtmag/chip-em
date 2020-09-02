# Bin correlation
multiBigwigSummary bins -b \
/home/rtm/chip-em/bam/HCT116_DKO_CEBPB.bw \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_WT_CEBPB.bw \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep3.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep2.bw \
--labels CHIPEM_DKO_CEBPB CHIPEM_DKO_H3K4me1 CHIPEM_WT_CEBPB CHIPEM_WT_H3K4me1 ENCODE_CEBPB_rep1 ENCODE_CEBPB_rep2 \
Bernstein_H3K4me1_iso1_rep1 Bernstein_H3K4me1_iso1_rep2 Bernstein_H3K4me1_iso2_rep1 Bernstein_H3K4me1_iso2_rep2 Bernstein_H3K4me1_iso2_rep3 \
Peggy_H3K4me1_rep1 Peggy_H3K4me1_rep2 \
-o /home/rtm/chip-em/chip_comparison/multiBigwigSummary_bin_default.npz

plotCorrelation \
    -in multiBigwigSummary_bin_default.npz \
    --corMethod spearman --skipZeros \
    --plotTitle "" \
    --whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
    -o multiBigwigSummary_bin_default.png 

multiBigwigSummary bins -bs 1000 -b \
/home/rtm/chip-em/bam/HCT116_DKO_CEBPB.bw \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_WT_CEBPB.bw \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep3.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep2.bw \
--labels CHIPEM_DKO_CEBPB CHIPEM_DKO_H3K4me1 CHIPEM_WT_CEBPB CHIPEM_WT_H3K4me1 ENCODE_CEBPB_rep1 ENCODE_CEBPB_rep2 \
Bernstein_H3K4me1_iso1_rep1 Bernstein_H3K4me1_iso1_rep2 Bernstein_H3K4me1_iso2_rep1 Bernstein_H3K4me1_iso2_rep2 Bernstein_H3K4me1_iso2_rep3 \
Peggy_H3K4me1_rep1 Peggy_H3K4me1_rep2 \
-o /home/rtm/chip-em/chip_comparison/multiBigwigSummary_bin1K.npz

plotCorrelation \
    -in multiBigwigSummary_bin_default.npz \
    --corMethod spearman --skipZeros \
    --plotTitle "" \
    --whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
    -o multiBigwigSummary_bin1K.png 
    
    #################################################################
multiBigwigSummary bins -b \
/home/rtm/chip-em/bam/HCT116_DKO_H3K4me1.bw \
/home/rtm/chip-em/bam/HCT116_WT_H3K4me1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic1_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep2.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Bernstein_isogenic2_rep3.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_H3K4me1_Peggy_rep2.bw \
--labels CHIPEM_DKO_H3K4me1 CHIPEM_WT_H3K4me1 \
Bernstein_H3K4me1_iso1_rep1 Bernstein_H3K4me1_iso1_rep2 Bernstein_H3K4me1_iso2_rep1 Bernstein_H3K4me1_iso2_rep2 Bernstein_H3K4me1_iso2_rep3 \
Peggy_H3K4me1_rep1 Peggy_H3K4me1_rep2 \
-o /home/rtm/chip-em/chip_comparison/multiBigwigSummary_HCT116_H3K4me1_bin_default.npz

plotCorrelation \
    -in multiBigwigSummary_HCT116_H3K4me1_bin_default.npz \
    --corMethod spearman --skipZeros \
    --plotTitle "" \
    --whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
    -o multiBigwigSummary_HCT116_H3K4me1_bin_default.png 
################################################################################################################################################################
################################################################################################################################################################
computeMatrix reference-point \
-S \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep1.bw \
/home/rtm/chip-em/encode_data/encode_bam/HCT116_CEBPB_rep2.bw \
/home/rtm/chip-em/bam/HCT116_WT_CEBPB.bw \
/home/rtm/chip-em/bam/HCT116_DKO_CEBPB.bw \
-R /home/rtm/chip-em/encode_data/encode_macs2/ENCODE_CEBPB_summits.bed --referencePoint center \
--sortRegions descend -bs 20 -a 1000 -b 1000 -p 20 -out chip_atac_shNT.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "ENCODE CEBPB PEAKS" --colorMap Blues \
-m chip_atac_shNT.mat \
 --samplesLabel "ENCODE_CEBPB1" "ENCODE_CEBPB2" "ChIPEM_WT_CEBPB" "ChIPEM_DKO_CEBPB" \
-out CEBPB_SIGNAL_onENCODEpeaks.pdf    
    
################################################################################################################################################################
################################################################################################################################################################
################################################################################################################################################################
################################################################################################################################################################

multiIntersectBed -i \
/home/rtm/chip-em/encode_data/encode_macs2/ENCODE_CEBPB_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_noInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_stephInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_noInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_stephInput_peaks.narrowPeak \
-names ENCODE_CEBPB ChIPEM_DKO_CEBPB_noInput ChIPEM_DKO_CEBPB_stephInp ChIPEM_WT_CEBPB_noInput ChIPEM_WT_CEBPB_stephInp \
-header > multi_cebpb.bed

multiIntersectBed -i \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_noInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_stephInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_noInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_stephInput_peaks.narrowPeak \
-names ChIPEM_DKO_CEBPB_noInput ChIPEM_DKO_CEBPB_stephInp ChIPEM_WT_CEBPB_noInput ChIPEM_WT_CEBPB_stephInp \
-header > multi_cebpb_em.bed

multiIntersectBed -i \
/home/rtm/chip-em/encode_data/encode_macs2/ENCODE_CEBPB_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_noInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_noInput_peaks.narrowPeak \
-names ENCODE_CEBPB ChIPEM_DKO_CEBPB_noInput  ChIPEM_WT_CEBPB_noInput \
-header > multi_cebpb_noInput.bed

multiIntersectBed -i \
/home/rtm/chip-em/encode_data/encode_macs2/ENCODE_CEBPB_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_DKO_CEBPB_stephInput_peaks.narrowPeak \
/home/rtm/chip-em/macs2/CHIPEM_WT_CEBPB_stephInput_peaks.narrowPeak \
-names ENCODE_CEBPB  ChIPEM_DKO_CEBPB_stephInp  ChIPEM_WT_CEBPB_stephInp \
-header > multi_cebpb_steph.bed
################################################################################################################################################################
################################################################################################################################################################

#R
library(VennDiagram)
multi_bed<-read.table("multi_cebpb.bed",header=T,stringsAsFactors=F)
list.multi<-list(ENCODE_CEBPB=which(multi_bed$ENCODE_CEBPB==1),
                 ChIPEM_DKO_CEBPB_noInput=which(multi_bed$ChIPEM_DKO_CEBPB_noInput==1),
                 ChIPEM_DKO_CEBPB_stephInp=which(multi_bed$ChIPEM_DKO_CEBPB_stephInp==1),
                 ChIPEM_DKO_CEBPB_stephInp=which(multi_bed$ChIPEM_DKO_CEBPB_stephInp==1),
                 ChIPEM_WT_CEBPB_noInput=which(multi_bed$ChIPEM_WT_CEBPB_noInput==1))
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_cebpb.pdf")
grid.draw(vp)
dev.off()
##################################
multi_bed<-read.table("multi_cebpb_em.bed",header=T,stringsAsFactors=F)
list.multi<-list(
                 ChIPEM_DKO_CEBPB_noInput=which(multi_bed$ChIPEM_DKO_CEBPB_noInput==1),
                 ChIPEM_DKO_CEBPB_stephInp=which(multi_bed$ChIPEM_DKO_CEBPB_stephInp==1),
                 ChIPEM_WT_CEBPB_stephInp=which(multi_bed$ChIPEM_WT_CEBPB_stephInp==1),
                 ChIPEM_WT_CEBPB_noInput=which(multi_bed$ChIPEM_WT_CEBPB_noInput==1))
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_cebpb_em.pdf")
grid.draw(vp)
dev.off()
##################################
multi_bed<-read.table("multi_cebpb_noInput.bed",header=T,stringsAsFactors=F)
list.multi<-list(ENCODE_CEBPB=which(multi_bed$ENCODE_CEBPB==1),
                 ChIPEM_DKO_CEBPB_noInput=which(multi_bed$ChIPEM_DKO_CEBPB_noInput==1),
                 ChIPEM_WT_CEBPB_noInput=which(multi_bed$ChIPEM_WT_CEBPB_noInput==1))
vp <- venn.diagram(list.multi,fill=c("purple","red","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_cebpb_noInput.pdf")
grid.draw(vp)
dev.off()
################################## 
library(VennDiagram)
multi_bed<-read.table("multi_cebpb_steph.bed",header=T,stringsAsFactors=F)
list.multi<-list(ENCODE_CEBPB=which(multi_bed$ENCODE_CEBPB==1),
                 ChIPEM_WT_CEBPB_stephInp=which(multi_bed$ChIPEM_WT_CEBPB_stephInp==1),
                 ChIPEM_DKO_CEBPB_stephInp=which(multi_bed$ChIPEM_DKO_CEBPB_stephInp==1)
                 )
vp <- venn.diagram(list.multi,fill=c("purple", "green","blue"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_cebpb_steph.pdf")
grid.draw(vp)
dev.off() 
