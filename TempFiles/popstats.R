
#EcolGenomics theta script 2/19/20
#Erika Bueno

setwd("C:/Users/ebuen/Desktop/Stats Files/TempFiles")

list.files()

SFS<- scan("CRA_outFold.sfs")
print(SFS) #should see 6 possible categories, these numbers correspond to the ML estimation of how many minor alleles are found in the populations

sumSFS<- sum(SFS)
print(sumSFS) #total number of sites

pctPoly= 100* (1-(SFS[1]/sumSFS))
print(pctPoly)

plotSFS<- SFS[-c(1, length(SFS))]
barplot(plotSFS)

div<- read.table("CRA_folded_allsites.thetas.idx.pestPG")
head(div)

colnames(div)= c("window", "chrname", "wincenter", "tW", "tP", "tF", "tH", "tL", "tajD", "fulif", "fuliD", "fayH", "zengsE", "numSites")

div$tWpersite<- div$tW/div$numSites
div$tPpersite<- div$tP/div$numSites

pdf("CRA_diversity_states.pdf")

par(mfrow = c(2,2))

histtW<-hist(div$tWpersite, col = "gray", xlab="Theta-W")

histtP<-hist(div$tPpersite, col = "gray", xlab="Theta-Pi")

histTaj<-hist(div$tajD, col = "gray", xlab="Tajimas D")

histsfs<-barplot(plotSFS)



library(ggplot2)
library(wesanderson)
histtW<-hist(div$tWpersite, col = "gray", xlab="Theta-W")

# Histogram for theta per site
gg1<- ggplot(div, aes(x=div$tWpersite)) + geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9) + theme_classic() + labs(x= "Theta-W per site", y="Frequency", title=" Theta-W per site")
print(gg1)

gg2<-ggplot(div, aes(x=div$tPpersite)) + geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9) + theme_classic() + labs(x= "Pi per site", y="Frequency", title="Theta Pi per site")
print(gg2)

gg3<-ggplot(div, aes(x=div$tajD)) + geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9) + theme_classic() + labs(x= "Tajimas D", y="Frequency", title="Tajimas D")
print(gg3)

histsfs<-barplot(plotSFS)

gg4<-barplot(plotSFS, 
        col="#69b3a2",
        ylab="Count",
        xlab= "Minor allele frequency (MAF)", 
        main="Folded SFS")



#library(devtools)
#install_github("thomasp85/patchwork")

library(patchwork)
all<- gg1 + gg2 + gg3 
print(all)

summary(div)

Cov<-3.49022 + 3.01947 + 3.6068 + 3.08303 + 3.26014 + 3.01703
avg_Cov<- Cov/6
avg_Cov

