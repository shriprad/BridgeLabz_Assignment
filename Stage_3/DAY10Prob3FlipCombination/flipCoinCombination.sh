#!/bin/bash




# for (( i=0; i<11; i++ ))
# do
#   FLIP=$(($(($RANDOM%10))%2))
#   if (( $FLIP == 1))
#   then
#     FLIP=H
#   else
#     FLIP=T
#
#   fi
#
#   arr[i]=$FLIP
#
#
# done



UC1(){
  count=0
  count1=0

  for (( i=0; i<10; i++ ))
  do
    FLIP=$(($(($RANDOM%10))%2))
    if (( $FLIP == 1 ))
    then
      count=$((count+1))
      FLIP=H
    else
      count1=$((count1+1))
      FLIP=T

    fi

    arr[i]=$FLIP
  done


  head_percentage=$(echo "scale=2;( $count/100 ) * 1000"  |bc)
  tail_percentage=$(echo "scale=2;( 100-$head_percentage )"  |bc)
  echo ${arr[@]}
  echo "Percentage of singlet combination of head is $head_percentage tails $tail_percentage"


}


UC2(){



  for (( i=0; i<10; i++ ))
  do
    FLIP=$(($(($RANDOM%10))%2))
    FLIP1=$(($(($RANDOM%10))%2))
    if (( $FLIP == 1 && $FLIP1 == 1  ))
    then
      d_count=$((d_count+1))
      FLIP=HH
    elif (( $FLIP == 1 && $FLIP1 == 0 ))
    then

      d_count1=$((d_count1+1))
      FLIP=HT

    elif (( $FLIP == 0 && $FLIP1 == 0 ))
    then

      d_count2=$((d_count2+1))
      FLIP=TT

    elif (( $FLIP == 0 && $FLIP1 == 1 ))
    then

      d_count3=$((d_count3+1))
      FLIP=TH



    fi

    arr_double[i]=$FLIP
  done


  head_percentage1=$(echo "scale=2;( $d_count/100 ) * 1000"  |bc)
  tail_percentage1=$(echo "scale=2;( $d_count1/100 ) * 1000"  |bc)
  head_percentage2=$(echo "scale=2;( $d_count2/100 ) * 1000"  |bc)
  tail_percentage2=$(echo "scale=2;( $d_count3/100 ) * 1000"  |bc)
  echo ${arr_double[@]}
  echo "Percentage of singlet combination of HH is $head_percentage1 HT $tail_percentage1 TT is $head_percentage2 TH is $tail_percentage2 "


}

UC1


UC2
