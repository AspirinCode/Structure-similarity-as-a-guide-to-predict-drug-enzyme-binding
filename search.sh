#!/bin/bash
#
# palyginti visus KEGG su drugbank

for file in *.mol
do
echo $file
if [ ! -f ${file%.mol}.log ]; then
    babel $file drugbank_all_fix.sdf -ofpt -xfFP4 > ${file%.mol}.log
fi
done
