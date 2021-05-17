# author Omid Gheysar
library(ggplot2)
library(tidyverse)
pdf("ggplot21.pdf")
count <- 0
mySequence <- seq(74,95)
for (i in mySequence[-which(mySequence==89)]){
  DF3 <- read.csv(paste0("data_",i,".csv"))
  p <- 0
  DF3 <- normalizeNumber(DF3)
  p <- ggplot(DF3, aes(x = V1, 
                       y=V2),
              color=factor(V1),
              colors = factor(V1))+
    stat_summary(fun.y = "mean", geom = "point", size = 3)+
    stat_summary(geom="errorbar",
                 width = 10, size = 1,
                 fun.y  = "median",
                 fun.ymin = function(x) quantile(x)[2],
                 fun.ymax = function(x) quantile(x)[4],size =1) +
    stat_summary(geom="line",
                 fun.y = "median",size=1)+theme_bw()
  
  p <- p + scale_x_continuous(breaks=c(10,20,50,100,150,200,300))
  p <- p + xlab("Read depth")
  p <- p + ylab("The number of SNPs")
  p
  print(p)     # Plot 1 --> in the first page of PDF
}
dev.off()


DF3
normalizeNumber <- function(DF3){
  for (i in seq(1:dim(DF3)[1])){
    residual <- i%% 7
    upTo7 <- 7 - residual
    if(residual==0){
      DF3[[3]][i] <- DF3[[3]][i] / (DF3[[3]][i])
    }else {
      DF3[[3]][i] <- DF3[[3]][i] / (DF3[[3]][i+ upTo7])
    }
  }
  return(DF3)
}



pdf("ggplot21_numberOfhSNPs.pdf")
count <- 0
mySequence <- seq(74,95)
for (i in mySequence[-which(mySequence==89)]){
  DF3 <- read.csv(paste0("data_",i,"_hSNPs.csv"))
  p <- 0
  # DF3 <- normalizeNumber(DF3)
  p <- ggplot(DF3, aes(x = V1, 
                       y=V2),
              color=factor(V1),
              colors = factor(V1))+
    stat_summary(fun.y = "mean", geom = "point", size = 3)+
    stat_summary(geom="errorbar",
                 width = 10, size = 1,
                 fun.y  = "median",
                 fun.ymin = function(x) quantile(x)[2],
                 fun.ymax = function(x) quantile(x)[4],size =1) +
    stat_summary(geom="line",
                 fun.y = "median",size=1)+theme_bw()
  
  p <- p + scale_x_continuous(breaks=c(10,20,50,100,150,200,300))
  p <- p + xlab("Read depth")
  p <- p + ylab("The number of hSNPs")
  p
  print(p)     # Plot 1 --> in the first page of PDF
}
dev.off()


library(ggplot2)
df1 <- data.frame(x = seq(2, 8, by = 2),
                  y = seq(30, 15, by = -5))
df2 <- data.frame(x = seq(2, 8, by = 2),
                  y = seq(12, 24, by = 4))

ggplot(df1, aes(x, log(y))) + 
  geom_line() +
  geom_line(data = df2, color = "red")






DF3 <- read.csv(paste0("data_",74,"_hSNPs.csv"))
p1 <- 0
# DF3 <- normalizeNumber(DF3)
p1 <- ggplot(DF3, aes(x = V1, 
                     y=V2),
            color=factor(V1),
            colors = factor(V1))+
  stat_summary(fun.y = "median", geom = "point", size = 3)+
  stat_summary(geom="errorbar",
               width = 10, size = 1,
               fun.y  = "median",
               fun.ymin = function(x) quantile(x)[2],
               fun.ymax = function(x) quantile(x)[4],size =1) +
  stat_summary(geom="line",
               fun.y = "median",size=1)+theme_bw()

p1 <- p1 + scale_x_continuous(breaks=c(10,20,50,100,150,200,300))
p1 <- p1 + xlab("Read depth")
p1 <- p1 + ylab("The number of hSNPs")
p1


DF3 <- read.csv(paste0("data_",75,"_hSNPs.csv"))
p2 <- 0
# DF3 <- normalizeNumber(DF3)
p2 <- ggplot(DF, aes(x = V1, 
                      y=V2),
             color=factor(V1),
             colors = factor(V1))+
  stat_summary(fun.y = "median", geom = "point", size = 3)+
  stat_summary(geom="errorbar",
               width = 6, size = .8,
               fun.y  = "median",
               fun.ymin = function(x) quantile(x)[2],
               fun.ymax = function(x) quantile(x)[4],size =1) +
  stat_summary(geom="line",
               fun.y = "median",size=1)+aes(colour = factor(V3)) +
  # aes(colour = factor(V3)) + stat_summary(fun = mean, geom="line")+
  theme_bw()

p2 <- p2 + scale_x_continuous(breaks=c(10,20,50,100,150,200,300))
p2 <- p2 + xlab("Read depth")
p2 <- p2 + ylab("The number of hSNPs")
p2


d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
d + stat_summary(fun.data = "mean_cl_boot", colour = "red", size = 2)
d + stat_summary(fun = "median", colour = "red", size = 2, geom = "point")
d + aes(colour = factor(vs)) + stat_summary(fun = mean, geom="line")

# simple version without normalize
mySequence <- seq(74,95)
for (i in mySequence[-which(mySequence==89)]){
  input <- read.csv(paste0("data_",i,"_hSNPs.csv"))
  input <- cbind(input,rep(i,70))
  if(i==74){
    DF3 <- input
  } else{
    DF3 <- rbind(DF3, input)
  }
}

normalizeNumber


DF <- normalizeNumber(DF3)

colnames(DF) <- c("X","V1", "V2","V3")














