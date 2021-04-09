
# indexing reference files
suffix=".fastq"
for i in 1;
do
read p
echo $p
bwa index H37Rv.fasta
done < sampleNames.txt

# alignment and mapping reads 
file1="_1.fastq.gz"
file2="_2.fastq.gz"
sam=".sam"
bam=".bam"
while read p
do
echo $p$file1
echo $p$file2
done < sampleNames.txt

for i in 3;
do 
read p
echo $p
echo $p$suffix
echo $p$file1
echo $p$file2
echo $p$sam
#bwa mem GenomicsWorkshop_data_day2/SRR2062305.fastq GenomicsWorkshop_data_day2/SRR2062305_1.fastq.gz GenomicsWorkshop_data_day2/SRR2062305_2.fastq.gz > GenomicsWorkshop_data_day2/SRR2062305_1.sam
#bwa mem H37Rv.fasta ERR1144974_Illumina_HiSeq_2000_paired_end_sequencing_1.fastq.gz ERR1144974_Illumina_HiSeq_2000_paired_end_sequencing_2.fastq.gz > ERR1144974_Illumina_HiSeq_2000_paired_end_sequencing.sam
bwa mem H37Rv.fasta $p$file1 $p$file2 > $p$sam
done < sampleNames.txt


for i in 3;
do 
read p
echo $p
./samtools view -b $p$sam > $p$bam
done < sampleNames1.txt

for i in 3;
do 
read p
echo $p
rm $p$sam
done < sampleNames.txt

sorted="_sorted.bam"
for i in 3;
do 
read p
echo $p
./samtools sort $p$bam > $p$sorted
done < sampleNames.txt



for i in 3;
do 
read p
echo $p
mv $p$sorted $p$bam
done < sampleNames.txt



for i in 3;
do 
read p
echo $p
./samtools index $p$bam
done < sampleNames.txt



for i in 3;
do 
read p
echo $p
./samtools flagstat $p$bam
done < sampleNames.txt






