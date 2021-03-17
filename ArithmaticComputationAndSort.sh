#!/bin/bash -x
read -p "Enter value a: " a
read -p "Enter value b: " b
read -p "Enter value c: " c

declare -A Results
declare -a ArrResults

Results[A]=$((a+b*c))
Results[B]=$((a*b+c))
Results[C]=`echo "scale=1;$c+$a/$b" | bc`
Results[D]=$((a%b+c))

ArrResults[0]=${Results[A]}
ArrResults[1]=${Results[B]}
ArrResults[2]=${Results[C]}
ArrResults[3]=${Results[D]}

echo ${ArrResults[@]}

for((i=0;i<${#ArrResults[@]};i++))
do
	for((j=0;j<((${#ArrResults[@]}-i-1));j++))
	do
		echo "j="$j" i="$i" ArrResults[$j]="${ArrResults[$j]}" ArrResults[$j+1]="${ArrResults[$j+1]}
		if [ $((`echo "if(( ${ArrResults[$j]}<${ArrResults[$j+1]} )) 1" | bc`)) -eq 1 ]
		then
			#swap
			ArrResults[$j]=`echo "scale=1;${ArrResults[$j]}+${ArrResults[$j+1]}" | bc`
			ArrResults[$j+1]=`echo "scale=1;${ArrResults[$j]}-${ArrResults[$j+1]}" | bc`
			ArrResults[$j]=`echo "scale=1;${ArrResults[$j]}-${ArrResults[$j+1]}" | bc`
		fi
	done
done

echo ${ArrResults[@]}
