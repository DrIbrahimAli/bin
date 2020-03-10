#!/bin/bash
for i in "$@"
do
shasum  "$i" >> hashes.pmt
done

sort hashes.pmt > hashes.tmp && rm hashes.pmt


while IFS= read -r i
do
echo ------- $i --------
#echo $prev
hash=`echo "$i" | cut -f 1 -d ' '`
filename=`echo "$i" |cut -f 3 -d' '`
echo hash is $hash
echo filename is $filename
[[ $hash == $prev ]] && mv $filename duplicates
prev=$hash
done < hashes.tmp
rm hashes.tmp
exit 0
