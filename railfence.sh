#!/bin/bash
#Prompts user for location
echo "Rail Fence Cipher Encryption"
echo "Enter the plaintext location: (eg:~/file.txt)"
#reads input
read string
stringZ=`cat $string | tr -d ' ' `
#encrypting
row1=${stringZ:0:1}${stringZ:6:1}${stringZ:12:1}${stringZ:18:1}
row2=${stringZ:1:1}${stringZ:5:1}${stringZ:7:1}${stringZ:11:1}${stringZ:13:1}${stringZ:17:1}${stringZ:19:1}
row3=${stringZ:2:1}${stringZ:4:1}${stringZ:8:1}${stringZ:10:1}${stringZ:14:1}${stringZ:16:1}${stringZ:20:1}
row4=${stringZ:3:1}${stringZ:9:1}${stringZ:15:1}${stringZ:21:1}

cipher=$row1$row2$row3$row4

echo "$cipher" >> encrypted.txt