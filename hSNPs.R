numberOfhSNPS <- function(inputFile){
  # Read VCF Files
  library(vcfR)
  vcf<-read.table(inputFile)
  # add one column for dp
  parseDp <- function(str) {
    string <- unlist(str_split(str,";"))[1]
    if(string == "INDEL"){
      dp <- 0
    }else{
      dp <- unlist(str_split(string,"="))[2]
    }
    return(dp)
  }
  dps <- sapply(vcf$V8,parseDp)
  vcf$dp <- with(vcf, dps )
  vcf$dp <- as.numeric(vcf$dp)
  
  # add one column for "0/1" or" 1/1"
  parseZerOne <- function(str) {
    zerOne <- unlist(str_split(str,":"))[1]
    return(zerOne)
  }
  
  zerOnes <- sapply(vcf$V10,parseZerOne)
  vcf$snpType <- with(vcf, zerOnes )
  
  
  # add one column for frequency of reference for hSNPs
  parseRef <- function(str) {
    string <- unlist(str_split(str,":"))[4]
    frequencies <- unlist(str_split(string,","))
    frequencies <- as.numeric(frequencies)
    notRefProportion <- frequencies[2]/(frequencies[1]+frequencies[2])
    if(1- notRefProportion == 0){
      return(0)
    }else{
      return(1- notRefProportion)
    }
    
  }
  fqRef <- sapply(vcf$V10,parseRef)
  vcf$fqRef <- with(vcf, fqRef )
  
  # filter the hSNPs 
  library(dplyr)
  hSNPs <- function(vcfFile, minimumDepth, minimuQuality, refFrequency){
    filterResult <- vcf  %>% filter(snpType =="0/1")%>% filter(dp>minimumDepth)%>% 
      filter(V6>minimuQuality) %>% filter(fqRef<refFrequency)
    return(filterResult)
  }
  
  # one example
  DP_low=5
  lowqual=20
  misPercent=.90
  output <- hSNPs(vcf,10,20,.9)
  # number of hSNPs
  return(dim(output)[1])
}

numberOfhSNPS("allsamples_1_20.vcf")

