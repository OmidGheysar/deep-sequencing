#this is the file to generate the bam file

suffix=".fastq"
# alignment and mapping reads 
file1="_1.fastq.gz"
file2="_2.fastq.gz"
sam=".sam"
bam=".bam"
sorted="_sorted.bam"

for i in 1;
do
echo Step1
read p
bwa index data_gene/NC_000962_3.fa
done < sampleNames.txt



while read p
do
echo Step2
bwa mem data_gene/H37Rv.fasta data_gene/$p$file1 data_gene/$p$file2 > data_gene/$p$sam
done < sampleNames.txt


while read p
do
echo Step3
./samtools view -b data_gene/$p$sam > data_gene/$p$bam
done < sampleNames.txt



while read p 
do
echo Step3
./samtools sort data_gene/$p$bam > data_gene/$p$sorted
done < sampleNames.txt

while read p
do
echo Step5
mv data_gene/$p$sorted data_gene/$p$bam
done < sampleNames.txt

while read p
do
echo Step6
./samtools index data_gene/$p$bam
done < sampleNames.txt


while read p
do
echo step7
echo $p
./samtools flagstat data_gene/$p$bam
done < sampleNames.txt


array=() 
while read p 
do
echo Step8
./samtools depth  data_gene/$p$bam  |  awk '{sum+=$3} END { print sum/NR}' > DepthCoverage.txt

while read m  
do 
   array+=("$m") 
done < DepthCoverage.txt 

done < sampleNames.txt

printf "%s\n" "${array[@]}" > outPutCoverage.txt











