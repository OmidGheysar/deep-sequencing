
# first script

# -----------------------------------------------
# Here is how to read vcf files show the summary of the file by print or data

library(vcfR)
vcf <- read.vcfR("allsamples_1_100.vcf")
data(vcf)
# ------------------------------------------------
# How to join characters with _ separation and then adding suffix
i <- 8
j <- 100
auto <- paste("allsamples", i, j, sep="_")
name <- paste0(auto, ".vcf")
vcf <- read.vcfR(name)
# -------------------------------------------
# How to iterate through different file depth and 10 example for each 
depths <- c(10,25,50,75,100,150)
for (i in 1:10) {
  for (j in depths){
    auto <- paste("allsamples", i, j, sep="_")
    name <- paste0(auto, ".vcf")
    vcf <- read.vcfR(name)
    print(vcf)
  }
}
# -------------------------------------------------------------
# Some extra code on how to filter data from vcf files 
# my.vcf.df <- cbind(as.data.frame(getFIX(vcf)), INFO2df(vcf))
# 
# library(tidyverse)
# filter_vcf <- my.vcf.df  %>%
#   filter(nchar(my.vcf.df$ALT)<=1) %>% filter(nchar(my.vcf.df$REF)<=1)
# 
# 
# filter_vcf <- my.vcf.df  %>%
#   filter(nchar(ALT)<=1)  %>%
#   filter(nchar(REF)<=1)  %>% 
#   select(POS,REF, ALT)
# -------------------------------------------------------------
# this is example of vcf file process the parameter are chose based on following logic
# ....
# vcfProcess("allsamples_1_100.vcf","output",NULL,1,NULL,NULL,FALSE,5,20,1,FALSE,90, NULL,NULL,FALSE)
# --------------------------------------------------------------------
# Iterate through all of the vcf files and then process them using vcf process with 
# the given set of parameters several output file will be generated for one vcf file
# one includes all of the indels another provides low quality variation (below20) 
# for deatil on the paramter I should refere to vcfProcess.R filw
depths <- c(10,25,50,75,100,150)
for (i in 1:10) {
  for (j in depths){
    auto <- paste("allsamples", i, j, sep="_")
    name <- paste0(auto, ".vcf")
    vcfProcess(name,paste("output", i, j, sep="_"),
               NULL,1,NULL,NULL,FALSE,5,20,1,FALSE,90, NULL,NULL,FALSE)
    # print(val)
  }
}
# the ouput_i_j_with_ref. csv files will be generated for each one of vcf files  
# -------------------------------------------------------------------------------

# we have 6 depth of coverage and 10 replicates for each so the data frame
# should be 10 by 6 or 60 
M <- matrix(nrow = 10, ncol = 7)
# long or short format
M1 <- matrix(nrow = 70, ncol = 2)
# iterate through outpufiles and enumerate the number of snips
count <- 0
for (i in 1:10) {
  index <- 0
  for (j in depths){
    index <- index +1 
    count <- count +1
    auto <- paste("output", i, j,"with","ref", sep="_")
    name <- paste0(auto, ".csv")
    outputFile <- read.csv(file = name)
    # auto <- paste("TB1", i, j,"sorted", sep="_")
    name <- names(read.csv(name))[3]
    M[i,index] <- sum(as.integer(outputFile$Reference!=outputFile[,name]))
    M1[count,1:2] <- c(j,sum(as.integer(outputFile$Reference!=outputFile[,name])))
  }
}
DF2 = as.data.frame(M)
DF3 = as.data.frame(M1)


# use ggplot to display the results
library(ggplot2)
g1 <- ggplot(DF3, aes(x = V1, 
                           y=V2),colors = factor(V1)) + 
  theme_bw()+geom_point()+xlab("Depth of read") + ylab("Number of SNIPs")
g1+ggtitle("Plot of Number of SNIPs versus read depth for TB1")
g1


write.csv(DF3, file = 'data_74.csv')
M3 <- matrix(nrow = 70, ncol = 2)
count <- 0
depths <- c(10,25,50,75,100,150)
for (i in 1:10) {
  for (j in depths){
    count <- count +1
    auto <- paste("allsamples", i, j, sep="_")
    name <- paste0(auto, ".vcf")
    M3[count,1:2] <- c(j,numberOfhSNPS(name))
    print(name)
    print(numberOfhSNPS(name))
  }
}

DF3 = as.data.frame(M3)


# use ggplot to display the results
library(ggplot2)
g1 <- ggplot(DF3, aes(x = V1, 
                      y=V2),colors = factor(V1)) + 
  theme_bw()+geom_point()+xlab("Depth of read") + ylab("Number of SNIPs")
g1+ggtitle("Plot of Number of SNIPs versus read depth for TB1")
g1




















