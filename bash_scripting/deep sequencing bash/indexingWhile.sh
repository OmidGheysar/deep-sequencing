
# indexing reference files
suffix=".fastq"
for i in 1;
do
read p
echo $p
bwa index GenomicsWorkshop_data_day2/$p$suffix
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

for i in 1;
do 
read p
echo $p
echo $p$suffix
echo $p$file1
echo $p$file2
echo $p$sam
#bwa mem GenomicsWorkshop_data_day2/SRR2062305.fastq GenomicsWorkshop_data_day2/SRR2062305_1.fastq.gz GenomicsWorkshop_data_day2/SRR2062305_2.fastq.gz > GenomicsWorkshop_data_day2/SRR2062305_1.sam
bwa mem GenomicsWorkshop_data_day2/$p$suffix GenomicsWorkshop_data_day2/$p$file1 GenomicsWorkshop_data_day2/$p$file2 > GenomicsWorkshop_data_day2/$p$sam
done < sampleNames.txt


for i in 1;
do 
read p
echo $p
./samtools view -b GenomicsWorkshop_data_day2/$p$sam > GenomicsWorkshop_data_day2/$p$bam
done < sampleNames.txt

for i in 1;
do 
read p
echo $p
rm GenomicsWorkshop_data_day2/$p$sam
done < sampleNames.txt

sorted="_sorted.bam"
for i in 1;
do 
read p
echo $p
./samtools sort GenomicsWorkshop_data_day2/$p$bam > GenomicsWorkshop_data_day2/$p$sorted
done < sampleNames.txt



for i in 1;
do 
read p
echo $p
mv GenomicsWorkshop_data_day2/$p$sorted GenomicsWorkshop_data_day2/$p$bam
done < sampleNames.txt



for i in 1;
do 
read p
echo $p
./samtools index GenomicsWorkshop_data_day2/$p$bam
done < sampleNames.txt



for i in 1;
do 
read p
echo $p
./samtools flagstat GenomicsWorkshop_data_day2/$p$bam
done < sampleNames.txt






