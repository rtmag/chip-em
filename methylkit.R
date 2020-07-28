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

# table(

# create dataframe

barplot(t(females),beside=T,ylim=c(0,70),xlab="Hair Color",ylab="Frequency of Eye 
              Color", col=color.names,axis.lty="solid")
############################################################################################################################################################
myobj[[1]][myobj[[1]]$chr=="lambda",]

