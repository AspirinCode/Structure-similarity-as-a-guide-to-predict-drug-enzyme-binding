#!/bin/bash

while read line
do
echo ${line:7:7}
if [ ! -f ${line:7:7}.targets ]; then
	        if [ -f ../Tanimoto_table_analyze/${line:7:7}.targets ]; then
			        cp ../Tanimoto_table_analyze/${line:7:7}.targets .
				        else
                                ./DB_target_get.pl ${line:7:7} > ${line:7:7}.targets
			fi
fi
done < Tanimoto_virs_0.9.csv
