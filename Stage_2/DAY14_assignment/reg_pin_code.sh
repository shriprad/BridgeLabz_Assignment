#!/bin/bash

shopt -s extglob

echo "Please enter your 6 digit pin-code"
read pin

pat="^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$"

if [[ $pin =~ $pat ]];
then
  echo "The entered pin-code is valid";

else
  echo "Please enter the valid pin-code";

fi
