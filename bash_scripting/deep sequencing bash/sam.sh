

suffix=".fastq"
# alignment and mapping reads 
file1="_1.fastq.gz"
file2="_2.fastq.gz"
sam=".sam"
bam=".bam"
sorted="_sorted.bam"

for i in 1;
do
read p
echo $p
bwa index data_gene/H37Rv.fasta
done < sampleNames.txt



for i in 3;
do 
read p
echo $p
echo $p$suffix
echo $p$file1
echo $p$file2
echo $p$sam
bwa mem data_gene/H37Rv.fasta data_gene/$p$file1 data_gene/$p$file2 > data_gene/$p$sam
done < sampleNames.txt


for i in 3;
do 
read p
echo $p
echo $p$sam
echo $p$bam
./samtools view -b data_gene/$p$sam > data_gene/$p$bam
# ./samtools view -b data_gene/ERR1144974_Illumina_HiSeq_2000_paired_end_sequencing.sam > data_gene/ERR1144974_Illumina_HiSeq_2000_paired_end_sequencingERR1144974_Illumina_HiSeq_2000_paired_end_sequencing.bam
done < sampleNames.txt



for i in 3;
do 
read p
echo $p
./samtools sort data_gene/$p$bam > data_gene/$p$sorted
done < sampleNames.txt

for i in 3;
do 
read p
echo $p
mv data_gene/$p$sorted data_gene/$p$bam
done < sampleNames.txt

for i in 3;
do 
read p
echo $p
./samtools index data_gene/$p$bam
done < sampleNames.txt


for i in 3;
do 
read p
echo $p
./samtools flagstat data_gene/$p$bam
done < sampleNames.txt








