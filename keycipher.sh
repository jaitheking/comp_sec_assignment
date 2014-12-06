#!/bin/bash
key=`echo $1 | tr '[:lower:]' '[:upper:]' `
P="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
mkey=$key$P
#Make the cipher
for ((i=0;i<${#mkey};++i)); do
    c=${mkey:i:1}
    tailmkey=${mkey:i+1}
    mkey=${mkey::i+1}${tailmkey//"$c"/}

done




#Do Substitution
echo $mkey | tr '[:lower:]' '[:upper:]'

OUT=`cat $2 | tr '[:lower:]' '[:upper:]' | tr $P $mkey`
echo $OUT >>encrypted.txt

#Reversal
#echo $OUT | tr $C $P


