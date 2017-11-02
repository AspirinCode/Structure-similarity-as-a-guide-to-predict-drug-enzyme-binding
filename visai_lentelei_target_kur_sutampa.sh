#!/bin/bash

echo "KEGGID,DBID,KEG targets,DB targets,sutapo"
while read line
do
#KEGG ID
#echo ${line::6}
#DB ID
#echo ${line:7:7}
#score
#echo ${line:14:8}

./palyginti_targets.pl ${line::6} ${line:7:7}
 
done < Tanimoto_virs_0.9.csv
