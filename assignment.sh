#!/bin/bash

#!/bin/bash
P="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# Doing the mapping to the Ciphertext
C="${P:$1:26}${P::$1}"
# Do substitution (tr command in Linux stands for translate)
OUT=`echo $2 | tr $P $C`
echo $OUT
# To reverse, do the opposite
echo $OUT | tr $C $P

