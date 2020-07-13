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
