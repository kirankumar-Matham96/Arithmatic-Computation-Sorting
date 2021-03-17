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


