#!/bin/bash -x
read -p "Enter value a: " a
read -p "Enter value b: " b
read -p "Enter value c: " c

declare -A Results

Results[A]=$((a+b*c))
Results[B]=$((a*b+c))
Results[C]=`echo "scale=1;$c+$a/$b" | bc`
Results[D]=$((a%b+c))

echo ${Results[@]}

