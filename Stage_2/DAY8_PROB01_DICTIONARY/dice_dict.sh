#!/bin/bash -x

dice_dictionary(){

  declare -A dice=( [1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 ) 


#This line satisfies condition a,b,c,d
  while ((flag!=1))
  do
    value=$(( RANDOM % 6 + 1))
    case "$value" in

      1) (( dice[1]++ ))

      ;;

      2) (( dice[2]++ ))
      ;;

      3) (( dice[3]++ ))
      ;;

      4) (( dice[4]++ ))
      ;;

      5) (( dice[5]++ ))
      ;;

      6) (( dice[6]++ ))
      ;;

    esac


    for (( i=1; i<7; i++))
    do
      if (( ${dice[$i]} == 10 ))
      then

        greatest=${dice[0]}
        flag=1
        result=$i
        echo "The dice which was thrown 10 times is $i"

        break

      fi
    done
  done

  #This line satisfies condition e

  small=${dice[1]}
  greatest=${dice[1]}
  for ((i=1; i<7; i++))
  do

    if [ ${dice[$i]} -lt $small ]; then
      small=${dice[$i]}

      echo "Smallest dice thrown is $i"


    elif [ ${dice[$i]} -gt $greatest ]; then
      greatest=${dice[$i]}
      echo "greatest dice thrown is $i"

    fi
  done

  echo ${dice[@]}
}

dice_dictionary
