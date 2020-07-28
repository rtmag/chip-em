library(methylKit)

file.list=list( 
"/home/rtm/chip-em/methylation_extractor/HCT116_DKO_CEBPB_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/HCT116_WT_CEBPB_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/K562_WT_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz"
 )

myobj=methRead(file.list,
           sample.id=list("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1"),
           assembly="hg38",
           treatment=c(1,2,3,4,5),
           context="CpG",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=5)
