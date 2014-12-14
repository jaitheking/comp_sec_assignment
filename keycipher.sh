#!/bin/bash
#Key Cipher Menu
echo "Key Cipher Encryption & Decryption Tool"
echo "1.Encrypt Text File."
echo "2.Decrypt Text File."
#Read the type of operation the user wants to do
read keyop;
#Selection Menu Implementation
case $keyop  in 

		1) 	echo "Enter a key word"
			read  keyword;
					
		  	echo "Enter the location of the text file to be encrypted (eg: ~/sample.txt) "	
	               read dir;

			key=`echo $keyword | tr '[:lower:]' '[:upper:]' `
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

			OUT=`cat $dir | tr '[:lower:]' '[:upper:]' | tr $P $mkey`
			echo $OUT >>encrypted.txt		
			echo "File has been encrypted and saved as 'encrypted.txt' ."
			;;
		2)
			echo "Enter the key word"
			read  keyword;
				
		  	echo "Enter the location of the text file (eg: ~/encrypted.txt) "	
	               read dir;

			key=`echo $keyword | tr '[:lower:]' '[:upper:]' `
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

			OUT=`cat $dir | tr '[:lower:]' '[:upper:]' | tr $mkey $P`
			echo $OUT >>decrypted.txt		
			echo "File has been decrypted and saved as 'decrypted.txt' ."
			;;

esac





