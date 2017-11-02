#!/bin/bash
#
# atsisiusti KEGG strukturas pagal ID faila

while read line
do
lin=$(echo $line | sed -e 's/^ *//' -e 's/ *$//');
if [[ ${#lin} -gt 1 ]]  && [[ ! -a ${lin}.mol ]]; then
#echo ${#lin}
#echo $lin 
wget http://www.genome.jp/dbget-bin/www_bget?-f+m+compound+${lin} -O ${lin}.mol
fi
done < Human_metabolites_su_KEGG_ID_fixed.csv
