#!/bin/bash
# set the STRING variable
STRING="Hello World!"
# print the contents of the variable on screen
# this is an example code in notepad++
#echo $STRING

while read p 
do
echo $p 
done < this.txt

cat this.txt | while read p 
do 
echo $p
done

cat template.txt | while read p 
do 
echo $p 
done 


while TFS='' read -r line
do 
echo $line
done<this.txt

