
# first script


# a <- 33
# 
# library(vcfR)
# i=1
# vcf <- read.vcfR("allsamples_1_100.vcf")
# data(vcf)
# 
# i <- 8
# j <- 100
# 
# auto <- paste("allsamples", i, j, sep="_")
# name <- paste0(auto, ".vcf")
# vcf <- read.vcfR(name)
# 
# 
# depths <- c(10,25,50,75,100,150)
# count <- 0
# for (i in 1:10) {
#   for (j in depths){
#     auto <- paste("allsamples", i, j, sep="_")
#     name <- paste0(auto, ".vcf")
#     vcf <- read.vcfR(name)
#     print(val)
#   }
# }
# print(count)
# 
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
# 
# vcfProcess("allsamples_1_100.vcf","output",NULL,1,NULL,NULL,FALSE,5,20,1,FALSE,90, NULL,NULL,FALSE)

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


M <- matrix(nrow = 10, ncol = 6)
M1 <- matrix(nrow = 60, ncol = 2)
carSpeeds <- read.csv(file = 'output_1_10.csv')
count <- 0
for (i in 1:10) {
  index <- 0
  for (j in depths){
    index <- index +1 
    count <- count +1
    auto <- paste("output", i, j,"with","ref", sep="_")
    name <- paste0(auto, ".csv")
    carSpeeds <- read.csv(file = name)
    auto <- paste("TB1", i, j,"sorted", sep="_")
    name <- paste0(auto, ".bam")
    M[i,index] <- sum(as.integer(carSpeeds$Reference!=carSpeeds[,name]))
    M1[count,1:2] <- c(j,sum(as.integer(carSpeeds$Reference!=carSpeeds[,name])))
  }
}
DF2 = as.data.frame(M)
DF3 = as.data.frame(M1)
# rownames(DF2)<-c('replicate1', 'replicate2', 'replicate3','replicate4',
#                 'replicate5', 'replicate6', 'replicate7','replicate8',
#                 'replicate9', 'replicate10')
# colnames(DF2)<- c('d10','d25','d50','d75','d100','d150')

library(ggplot2)
# require(ggplot2)
# require(reshape2)
# df1 <- melt(data,"Row.names")
# g1 <- ggplot(DF2, aes(x = Row.names, y=DF2$d10)) + 
#   theme_bw()+ 
#   theme(axis.text.x = element_text(angle=-40, hjust=.1))
# 
# my_data <- USArrests[c(1, 10, 20, 30), ]
# my_data
# 
# my_data <- cbind(state = rownames(my_data), my_data)
# my_data
# 
# my_data <- cbind(state = rownames(DF2), DF2)
# my_data2 <- gather(my_data,
#                    key = "arrest_attribute",
#                    value = "arrest_estimate",
#                    -state)
# my_data2


# g1 <- ggplot(my_data2, aes(x = arrest_attribute, 
#                            y=arrest_estimate)) + 
#   theme_bw()
# 
# 
# g1+geom_point()



g1 <- ggplot(DF3, aes(x = V1, 
                           y=V2),colors = factor(V1)) + 
  theme_bw()+geom_point()+xlab("Depth of read") + ylab("Number of SNIPs")
g1+ggtitle("Plot of Number of SNIPs versus read depth for TB1")+ geom_boxplot()



p <- ggplot(mtcars, aes(wt, mpg))
# A basic scatter plot
p + geom_point(size = 4)

cars <- mtcars

p + geom_point(aes(colour = factor(cyl)), size = 4)

g1 + geom_point(aes(colour = factor(V1)), size = 3)

g1 <- g1 + geom_line(aes(group = factor(V1)))
g1






