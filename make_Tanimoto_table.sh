#!/bin/bash
#
# make Tanimoto Table from logs
# VR

##pirma eilute:
#echo -n "KEGG,"  > Tanimoto_table.csv
#numeriai=$(grep Tanimoto C00001.log | awk '{printf "%s,",$1}')
#for i in {1..6858}
#do
#echo $i
#ID=$(./numeris_i_ID.pl numeris${i} | tr -d "\n")
#numeriai=$(echo $numeriai | sed "s/numeris${i}/$ID/" | tr -d ">")
#done
#echo $numeriai >> Tanimoto_table.csv
cat Tanimoto_table_line1.txt > Tanimoto_table.csv 

#kitos:
for file in *.log
do
echo -n "${file%.log}," >> Tanimoto_table.csv
grep Tanimoto $file | awk '{printf "%s,",$7}' >> Tanimoto_table.csv
echo "" >> Tanimoto_table.csv
done


