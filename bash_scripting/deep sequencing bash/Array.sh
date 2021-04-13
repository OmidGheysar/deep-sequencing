#!/bin/bash

echo welcome to bash!

echo let try bash array

os=('ubuntu' 'windows' 'kali' 'lets add one more line' 'Avocado yuske')
os[4]='mac'

echo "${os[@]}"

echo "${os[0]}"

echo "${!os[@]}"

echo "${#os[@]}"

printf "%s\n" "${os[@]}" > file.txt


for i in {0..4}
do
read p 
os[$i]="$p"
echo "Welcome $i times"
done < file.txt


# printf "%s\n" "${os[@]}" > file.txt
array=() 
while read p 
do 
   array+=("$p") 
done < file.txt 

printf "%s\n" "${array[@]}" > file.txt
