

fileConn<-file("output.txt")
d <- NULL
for (i in 1144974:1144995){
  str1 = 'ERR'
  str3 = '_Illumina_HiSeq_2000_paired_end_sequencing'
  # concatenate two strings using paste function
  d <- c(d,paste(str1,as.character(i),str3,sep=""))
}
writeLines(d, fileConn)
# write.table(d,"my_data.txt")
# write.csv(d, file = "my_data.csv")
close(fileConn)
#write.table(d, "afilename.csv", sep=";", col.names=FALSE, quote=FALSE, row.names=FALSE)

my_data <- read.delim("outPutCoverage.txt")
plot(my_data)

1:10
avector <- my_data[['all']]
my_data$num <- 1:22
df <- data.frame(num=1:22, all=sort(avector))
my_data

library(ggplot2)
# Basic barplot
p<-ggplot(data=df, aes(x=num, y=all)) +
  geom_bar(stat="identity")+theme_bw()
p <- p + scale_x_continuous(breaks=1:22)
p <- p + scale_y_continuous(breaks=seq(0,800,100))
p <- p + xlab("Sample")
p <- p + ylab("Read Depth")
p



# Horizontal bar plot
# p + coord_flip()


