#!/bin/bash 
echo "enter a three digit  number"

read n
declare -A dict=([even]=0 [odd]=0)

if  [[ $n -gt 99 &&  $n -lt 1000 ]]

then

	#variable
	r=0
	rev=0
	temp=$n
	

	while [ $temp -gt 0 ]
	do
		r=$(($temp%10))
		rev=$(($rev*10+$r))
		temp=$(($temp/10))
	done
	if [ $n -eq  $rev ]
	then
   	echo "Number is palindrome"
	else
    	echo "Number is not palindrome"
	fi



	echo "Prime factores are using factorization " 

	for (( i=2; i<=$n*$n; i++ ))
	do
		while [ $((n%i)) -eq 0 ]
		do
			echo $i
			if [ $((i%2)) -eq 0 ] #checking even
			then
				#arrEven[$i]=$((i))
				((dict[even]++))
			#	((even++))
			fi
			if [ $(($i%2)) -ne 0 ] #checking odd
			then
			#	arrOdd[odd]=$i
				((dict[odd]++))
		#	((odd++))
			fi
		n=$((n/i))
	done
done


echo "Keys  : ${!dict[@]}"
echo "Count : ${dict[@]}"

else
	echo "3 digit num required"
fi
