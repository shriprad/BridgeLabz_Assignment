#!/bin/bash

count=0
count1=0
iterations=21

while(( $count <= $iterations ||$count1 <=$iterations ))
do
  FLIP=$(($RANDOM %2))
  if [ $FLIP -eq 1 ];then
    echo "Heads"
    count1=`expr $count1 + 1`

  else
    echo "tails"
    count=`expr $count + 1`
  fi
  if (( $count ==$iterations && $count1==$iterations ))
  then
    echo "It's a tie"
    iterations=$(($iterations+2))

  elif (( $count ==$iterations || $count1==$iterations ))
  then

    if (( $count1==$iterations ))
    then
      echo "Head won $count1 times and Tail won $count times"

    else
      echo "Tail won $count times and Head won $count1 times"
    fi

    break



  fi


done
