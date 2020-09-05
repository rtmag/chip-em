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
           mincov=0)

############################################################################################################################################################
# lambda conversion rates
lambda_conversionRates <- rep(0,5)
names(lambda_conversionRates) <- c("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1")
tmpobj <- 0
# HCT_DKO_CEBPB
tmpobj <- myobj[[1]][which(myobj[[1]]$chr=="lambda"),]
lambda_conversionRates[1]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_DKO_H3K4me1
tmpobj <- myobj[[2]][which(myobj[[2]]$chr=="lambda"),]
lambda_conversionRates[2]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_CEBPB
tmpobj <- myobj[[3]][which(myobj[[3]]$chr=="lambda"),]
lambda_conversionRates[3]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_H3K4me1
tmpobj <- myobj[[4]][which(myobj[[4]]$chr=="lambda"),]
lambda_conversionRates[4]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# K562_WT_H3K4me1
tmpobj <- myobj[[5]][which(myobj[[5]]$chr=="lambda"),]
lambda_conversionRates[5]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
############################################################################################################################################################
# puc19 conversion rates
puc19_conversionRates <- rep(0,5)
names(puc19_conversionRates) <- c("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1")
tmpobj <- 0
# HCT_DKO_CEBPB
tmpobj <- myobj[[1]][which(myobj[[1]]$chr=="puc19"),]
puc19_conversionRates[1]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_DKO_H3K4me1
tmpobj <- myobj[[2]][which(myobj[[2]]$chr=="puc19"),]
puc19_conversionRates[2]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_CEBPB
tmpobj <- myobj[[3]][which(myobj[[3]]$chr=="puc19"),]
puc19_conversionRates[3]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_H3K4me1
tmpobj <- myobj[[4]][which(myobj[[4]]$chr=="puc19"),]
puc19_conversionRates[4]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# K562_WT_H3K4me1
tmpobj <- myobj[[5]][which(myobj[[5]]$chr=="puc19"),]
puc19_conversionRates[5]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
############################################################################################################################################################
# chrM conversion rates
chrM_conversionRates <- rep(0,5)
names(chrM_conversionRates) <- c("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1")
tmpobj <- 0
# HCT_DKO_CEBPB
tmpobj <- myobj[[1]][which(myobj[[1]]$chr=="chrM"),]
chrM_conversionRates[1]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_DKO_H3K4me1
tmpobj <- myobj[[2]][which(myobj[[2]]$chr=="chrM"),]
chrM_conversionRates[2]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_CEBPB
tmpobj <- myobj[[3]][which(myobj[[3]]$chr=="chrM"),]
chrM_conversionRates[3]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# HCT_WT_H3K4me1
tmpobj <- myobj[[4]][which(myobj[[4]]$chr=="chrM"),]
chrM_conversionRates[4]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
# K562_WT_H3K4me1
tmpobj <- myobj[[5]][which(myobj[[5]]$chr=="chrM"),]
chrM_conversionRates[5]<-round(sum(tmpobj$numTs)/sum(tmpobj$coverage)*100,digits=3)
############################################################################################################################################################
lambda_conversionRates
puc19_conversionRates
chrM_conversionRates
############################################################################################################################################################
HCT_DKO_CEBPB_cov <- myobj[[1]]$coverage
HCT_DKO_H3K4me1_cov <- myobj[[2]]$coverage
HCT_WT_CEBPB_cov <- myobj[[3]]$coverage
HCT_WT_H3K4me1_cov <- myobj[[4]]$coverage
K562_WT_H3K4me1_cov <- myobj[[5]]$coverage

HCT_DKO_CEBPB_cov[HCT_DKO_CEBPB_cov>20] <- 20
HCT_DKO_H3K4me1_cov[HCT_DKO_H3K4me1_cov>20] <- 20
HCT_WT_CEBPB_cov[HCT_WT_CEBPB_cov>20] <- 20
HCT_WT_H3K4me1_cov[HCT_WT_H3K4me1_cov>20] <- 20
K562_WT_H3K4me1_cov[K562_WT_H3K4me1_cov>20] <- 20

pdf("allCytosine_coverage.pdf")
plot(density(HCT_WT_CEBPB_cov),col="blue",main="ChIP-EM Cytosine Coverage")
lines(density(HCT_DKO_H3K4me1_cov),col="red")
lines(density(HCT_DKO_CEBPB_cov),col="black")
lines(density(HCT_WT_H3K4me1_cov),col="purple")
lines(density(K562_WT_H3K4me1_cov),col="darkgreen")
legend("topright",  legend=c("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1"), 
       fill=c('black','red','blue',"purple","darkgreen"), bty = "n")
dev.off()


pdf("allCytosine_coverage.pdf")
plot(density(HCT_DKO_H3K4me1_cov),col="blue",main="ChIP-EM Cytosine Coverage")
lines(density(HCT_DKO_H3K4me1_cov),col="red")
lines(density(HCT_DKO_CEBPB_cov),col="black")
lines(density(HCT_WT_H3K4me1_cov),col="purple")
lines(density(K562_WT_H3K4me1_cov),col="darkgreen")
legend("topright",  legend=c("HCT_DKO_CEBPB","HCT_DKO_H3K4me1","HCT_WT_CEBPB","HCT_WT_H3K4me1","K562_WT_H3K4me1"), 
       fill=c('black','red','blue',"purple","darkgreen"), bty = "n")
dev.off()

# table(

# create dataframe

barplot(t(females),beside=T,ylim=c(0,70),xlab="Hair Color",ylab="Frequency of Eye 
              Color", col=color.names,axis.lty="solid")
############################################################################################################################################################
myobj[[1]][myobj[[1]]$chr=="lambda",]

############################################################################################################################################################
puc19_cg_wt<-read.table(pipe("more HCT116_WT_H3K4me1_puc19.CX_report.txt |grep -w CG"),sep="\t")
round(sum(puc19_cg_wt[,4])/sum(puc19_cg_wt[,4],puc19_cg_wt[,5])*100,digits=3)

puc19_cg_dko<-read.table(pipe("more HCT116_DKO_H3K4me1_puc19.CX_report.txt |grep -w CG"),sep="\t")
round(sum(puc19_cg_dko[,4])/sum(puc19_cg_dko[,4],puc19_cg_dko[,5])*100,digits=3)
############################################################################################################################################################
############################################################################################################################################################
############################################################################################################################################################
############################################################################################################################################################
# Is Chip-EM methylation profile the same as WGBS?
library(methylKit)
file.list=list( 
"/home/rtm/chip-em/hct116_wgbs/combine_hct116_WGBS_1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz"
 )

myobj=methRead(file.list,
           sample.id=list("HCT116_WGBS","HCT116_WT_H3K4me1"),
           assembly="hg38",
           treatment=c(1,2),
           context="CpG",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=5)

meth=unite(myobj, destrand=TRUE,mc.cores=20)
pooled.meth=pool(meth,sample.ids=c("HCT116_WGBS","HCT116_WT_H3K4me1"))
myDiff=calculateDiffMeth(pooled.meth,num.cores=20)
###
options(bitmapType="cairo")
library(ggplot2)
png("VOLCANO_WGBS_VS_CHIPEM_METH_gray.png")
plot(myDiff$meth.diff,-log10(myDiff$qvalue),xlim=c(-100,100),ylim=c(0,7),
             xlab = "DNA methylation difference (WGBS / CHiP-EM)",
             ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20)
abline(h=-log10(.05),lty=2)
abline(v=25,lty=2)
abline(v=-25,lty=2)
legend("topright", paste("WGBS:",length(which(myDiff$meth.diff>25 & myDiff$qvalue<0.05))), bty="n") 
legend("topleft", paste("CHiP-EM:",length(which(myDiff$meth.diff<(-25) & myDiff$qvalue<0.05))), bty="n") 
#points(myDiff$meth.diff[abs(myDiff$meth.diff)>25 & myDiff$qvalue<0.05],
#       -log10(myDiff$qvalue[abs(myDiff$meth.diff)>25 & myDiff$qvalue<0.05]),
#       col=alpha("#c0392b",.01) )
dev.off()
###

file.list=list( 
"/home/rtm/chip-em/methylation_extractor/HCT116_DKO_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/chip-em/methylation_extractor/HCT116_WT_H3K4me1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz"
 )

myobj=methRead(file.list,
           sample.id=list("HCT_DKO_H3K4me1","HCT_WT_H3K4me1"),
           assembly="hg38",
           treatment=c(1,2),
           context="CpG",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=5)

dko <- getData(myobj[[1]])
wt <- getData(myobj[[2]])

pdf("beta_density_dko.pdf")
plot(density(dko[,6]/dko[,5]),xlab="Beta value distribution DKO")
dev.off()

pdf("beta_density_wt.pdf")
plot(density(wt[,6]/wt[,5]),xlab="Beta value distribution WT")
dev.off()
#####
