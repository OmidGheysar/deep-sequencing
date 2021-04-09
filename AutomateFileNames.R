

fileConn<-file("output.txt")
d <- NULL
for (i in 1144974:1144995){
  str1 = 'ERR'
  str3 = '_Illumina_HiSeq_2000_paired_end_sequencing.fastq'
  # concatenate two strings using paste function
  d <- c(d,paste(str1,as.character(i),str3,sep=""))
}
writeLines(d, fileConn)
close(fileConn)