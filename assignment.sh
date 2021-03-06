#!/bin/bash

#Main Menu
clear
echo "Welcome to Key/Rail Fence Cipher Encryption/Decryption Tool"
echo "Please pick which cipher technique you wish to use to encrypt/decrypt."
echo "1.Key Cipher"
echo "2.Rail Fence (4 rows) Cipher"
read userchoice

case $userchoice in
#Key Cipher Menu
	1) 	
		clear
		echo "Key Cipher Encryption & Decryption Tool"
		echo "1.Encrypt Text File."
		echo "2.Decrypt Text File."
		#Read the type of operation the user wants to do
		read keyop;
		#Selection Menu Implementation
		case $keyop  in 

		1) 	echo "Enter a key word"
			#Read the keyword from user
			read  keyword;
					
		  	echo "Enter the location of the text file to be encrypted (eg: ~/sample.txt) "	
	        #Read the directory of the text file from user
	        read dir;

			#Encryption Implementation

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
			#Prints out the output to a new file
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
			#Prints out the output to a new file
			echo $OUT >>decrypted.txt		
			echo "File has been decrypted and saved as 'decrypted.txt' ."
			;;

	esac;;

#Rail Fence 4-Row Cipher Menu	
	2) 	
		clear
		echo "Rail Fence (4-rows) Cipher Encryption & Decryption Tool"
		echo "Enter the plaintext location: (eg:~/file.txt)"
		echo "1.Encrypt Text File."
		echo "2.Decrypt Text File."
		#Read the type of operation the user wants to do
		read fenceop;

		#Selection Menu Implementation
		case $fenceop  in 
			1)	echo "Please enter the location of the textfile you wish to encrypt (eg. ~/sample.txt)"
				#reads input
				read string
				stringZ=`cat $string | tr -d ' ' | tr '[:lower:]' '[:upper:]'`
				#Encrypting via transposition of original plaintext
				row1=${stringZ:0:1}${stringZ:6:1}${stringZ:12:1}${stringZ:18:1}
				row2=${stringZ:1:1}${stringZ:5:1}${stringZ:7:1}${stringZ:11:1}${stringZ:13:1}${stringZ:17:1}${stringZ:19:1}
				row3=${stringZ:2:1}${stringZ:4:1}${stringZ:8:1}${stringZ:10:1}${stringZ:14:1}${stringZ:16:1}${stringZ:20:1}
				row4=${stringZ:3:1}${stringZ:9:1}${stringZ:15:1}${stringZ:21:1}

				#Concatenating the string after permutation
				cipher=$row1$row2$row3$row4
				#Prints out the output to a new file	
				echo "$cipher" >> encrypted.txt
				echo "Encryption is successful. The text file is saved as encrypted.txt"
				;;


			2) echo "Please enter the location of the textfile you wish to decrypt (eg. ~/encrypted.txt)"
				#reads input
				read string
				stringZ=`cat $string | tr -d ' ' | tr '[:upper:]' '[:lower:]'`
				#Decrypting via re-transpositioning of ciphertext
				row1=${stringZ:0:1}${stringZ:4:1}${stringZ:11:1}${stringZ:17:1}
				row2=${stringZ:12:1}${stringZ:5:1}${stringZ:1:1}
				row3=${stringZ:6:1}${stringZ:13:1}${stringZ:18:1}
				row4=${stringZ:14:1}${stringZ:7:1}${stringZ:2:1}
				row5=${stringZ:8:1}${stringZ:15:1}${stringZ:19:1}
				row6=${stringZ:16:1}${stringZ:9:1}${stringZ:3:1}
				row7=${stringZ:10:1}${stringZ:21:1}

				#Concatenating the string after permutation
				cipher=$row1$row2$row3$row4$row5$row6$row7
				#Prints out the output to a new file	
				echo "$cipher" >> decrypted.txt
				echo "Decryption is completed. Please know that the decryption is not 100% accurate. The text file is saved as decrypted.txt"
			;;

esac;;









esac

echo "'Thank you for using my encryption/decryption tool'"
echo " From Jaiprashanth 1131122948"


