#!/bin/bash

for file in *.mol
do
if [ ! -s $file ]; then
echo "trinti: ${file%.mol}"
rm ${file%.mol}*
fi
done
