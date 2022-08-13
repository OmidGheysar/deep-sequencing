# author Omid Gheysar


library(ggplot2)
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
# simple version without normalize
mySequence <- seq(74,95)
for (i in mySequence[-c(which(mySequence==89), which(mySequence==92))]){
  input <- read.csv(paste0("data_",i,"_hSNPs.csv"))
  input <- read.csv(paste0("data_",i,".csv"))
  input <- cbind(input,rep(i,70))
  if(i==74){
    DF3 <- input
  } else{
    DF3 <- rbind(DF3, input)
  }
}

DF <- normalizeNumber(DF3)

colnames(DF) <- c("X","V1", "V2","V3")


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
p2 <- p2 + ylab("The proportion of hSNPs")
p2 <- p2 + ylab("The proportion of SNPs")
p2

#this is added












