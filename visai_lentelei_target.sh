#!/bin/bash

while read line
do
echo ${line::6}
if [ ! -f ${line::6}.targets ]; then

	if [ -f ../Tanimoto_table_analyse/${line::6}.targets ]; then
	cp ../Tanimoto_table_analyse/${line::6}.targets .
        else
        ./KEGG_target_get.pl ${line::6} > ${line::6}.targets
        fi

fi
done < Tanimoto_virs_0.9.csv
