#!/bin/bash

read -p "Enter a number: " number

num=0

while [[ $number -ne 0 ]]
do
        num=$(expr $num  \* 10)

        r=$(expr $number % 10)

        num=$(expr $num + $r)

        number=$(expr $number / 10)
done

echo "Reverse number is $num"


