#!/bin/bash -x
read -p "Enter value a: " a
read -p "Enter value b: " b
read -p "Enter value c: " c

A=$((a+b*c))
B=$((a*b+c))
C=`echo "scale=1;$c+$a/$b" | bc`
D=$((a%b+c))
