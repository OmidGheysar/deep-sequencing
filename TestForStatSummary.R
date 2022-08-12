# author Omid Gheysar
library(ggplot2)
library(tidyverse)
aes_x <- "p.trace_app"
aes_y <- "Revenue"
aes_col <- "p.trace"
aes_grp <- "p.trace"

long_results <- read.csv("Rshiny.csv")
p <- ggplot(long_results,
            aes(x=eval(as.name(aes_x)),
                y=eval(as.name(aes_y)),
                color=factor(eval(as.name(aes_col))),
                group=eval(as.name(aes_grp)))) 

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
















