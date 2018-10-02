#!/bin/bash
OLDIFS=$IFS; IFS=","
while read product price quantity; do
echo -e "\e[1;32m$product \
======================= \e[0m\n\
Price :\t\t $price \n\
Quantity :\t  $quantity"
done < $1
IFS=$OLDIFS
