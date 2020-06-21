echo "Welcome to solution of sorting arithematic computation problem"

read -p "Please enter first number" a
read -p "Please enter second number" b
read -p "Please enter third number" c







ascending(){


  arr_asc=("$@")

  #echo "The values are ${arr[@]}"
  for (( i=0; i<4; i++))
  do

    for (( j=0; j<5-i-1; j++))
    do

      if (( ${arr_asc[j]} > ${arr_asc[$((j+1))]} ))
      then
        temp=${arr_asc[j]}
        arr_asc[$j]=${arr_asc[$((j+1))]}
        arr_asc[$((j+1))]=$temp

      fi


    done

  done

  echo "Computed values in ascending order :"
  echo ${arr_asc[*]}




}


descending(){


  arr_desc=("$@")

  #echo "The values are ${arr_desc[@]}"
  for (( i=0; i<4; i++))
  do
    for ((j=i; j<4; j++))
    do
      if (( ${arr_desc[i]} < ${arr_desc[j]} ))
      then
        t=${arr_desc[i]}
        arr_desc[$i]=${arr_desc[j]}
        arr_desc[$j]=$t

      fi
    done
  done

  echo "Computed values in descending order :"
  echo ${arr_desc[@]}




}


compute(){
  declare -A arithematic=( [1]=0 [2]=0 [3]=0 [4]=0  )
  array=( 0 0 0 0 )

  add=$((($b*$c)+$a))
  arithematic[1]=$add
  add1=$((($a*$b)+$c))
  arithematic[2]=$add1
  divide=$((($a/$b)+$c))
  arithematic[3]=$divide
  mod=$((($a%$b)+$c))
  arithematic[4]=$mod
  # i=1
  # j=$(($i+1))
  # #echo ${arithematic[@]}
  # array[0]=${arithematic[$j]}
  # echo ${array[@]}

  for (( i=0; i<4; i++ ))
  do
    j=$(($i+1))
    array[$i]=${arithematic[$j]}

  done

  echo "Array in original order ${array[@]}"

  ascending "${array[@]}"

  descending "${array[@]}"


}

compute
