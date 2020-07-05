#!/bin/bash




[[ ! -z "$1" ]] && count="$1" || count=1

format1='Y-m-d'
format2='d-U-Y'
format3='j M y'
format4='M j, Y'

if [[ ! -z "$2" ]]; then
  if [[ "$2" == "1" ]]; then
    format="$format1"
  elif [[ "$2" == "2" ]]; then
    format="$format2"
  elif [[ "$2" == "3" ]]; then
    format="$format3"
  elif [[ "$2" == "4" ]]; then
    format="$format4"
  else
    format="$2"
  fi
else
  format="$format1"
fi

[[ ! -z $3 ]] && start_year=$3 || start_year=1992
[[ ! -z $4 ]] && end_year=$4 || end_year=1993

JAN=31
FEB=28
MAR=31
APR=30
MAY=31
JUN=30
JUL=31
AUG=31
SEP=30
OCT=31
NOV=30
DEC=31



function is_leap_year() {
  if [[ $(date -d "Dec 31, $1" +%j) -eq 366 ]]; then
    echo 1
  else
    echo 0
  fi
}


function display_date() {
  format="$1"

  year=$2
  year_short=${year:2:3}
  leap_year=$(is_leap_year $year)

  months_upper=(XXX JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC)
  months_cap=(XXX Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
  month=$3
  for i in $(seq 12); do
    [[ $month == ${months_upper[$i]} ]] \
      && month_cap=${months_cap[$i]} \
      && month_numeric=$i \
      && month_padded=$i
  done
  [[ $month_padded -lt 10 ]] && month_padded=0$month_padded

  day_padded=$4
  day_numeric=$(echo $day_padded | sed -e 's/^0//')

  output="$(echo "$format" | sed \
    -e "s~Y~$year~g" \
    -e "s~y~$year_short~g" \
    -e "s~L~$leap_year~g" \
    -e "s~m~$month_padded~g" \
    -e "s~n~$month_numeric~g" \
    -e "s~d~$day_padded~g" \
    -e "s~j~$day_numeric~g" \
    -e "s~M~$month_cap~g" \
    -e "s~U~$month~g" \
  )"

  echo "$output"
}


function rand_nums() {
  if [[ -z $1 ]] || [[ -z $2 ]]; then
    echo -e "\nError: Missing required arguments.\n\nSyntax:\n$0 [start] [end] [count]\n"
    exit
  fi

  start=$1
  end=$2
  [[ ! -z $3 ]] && count=$3 || count=1

  if [[ $end -le $start ]]; then
    echo -e "\nError: Ending value must be greater than starting value.\n"
    exit
  fi
  diff=$(($end-$start+1))

  for i in $(seq $count); do
    echo $(($(($RANDOM%$diff))+$start))
  done
}

function rand_day() {
  [[ ! -z $1 ]] && highest_date=$1 || highest_date=28
  [[ ! -z $2 ]] && count=$2 || count=1
  for i in $(rand_nums 1 $highest_date $count); do
    if [[ $i -lt 10 ]]; then
      echo 0$i
    else
      echo $i
    fi
  done
}


function rand_month() {
  [[ ! -z $1 ]] && count=$1 || count=1
  months=(JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC)
  for i in $(rand_nums 0 11 $count); do
    echo ${months[$i]}
  done
}


function rand_year() {
  [[ ! -z $1 ]] && start_year=$1 || start_year=2000
  [[ ! -z $2 ]] && end_year=$2 || end_year=$(date +%Y)
  [[ ! -z $3 ]] && count=$3 || count=1
  rand_nums $start_year $end_year $count
}


function rand_date() {
  [[ ! -z $1 ]] && count=$1 || count=1
  [[ ! -z "$2" ]] && format="$2"
  rand_months=($(rand_month $count))
  rand_years=($(rand_year $start_year $end_year $count))

  for i in $(seq 0 $((count - 1))); do
    # Logic to add a day to Feb on leap years
    year=${rand_years[$i]}
    leap=$(is_leap_year $year)
    month=${rand_months[$i]}
    month_days=${!rand_months[$i]}
    if [[ $leap -eq 1 ]] && [[ "$month" == "FEB" ]]; then
      month_days=29
    fi
    day=$(rand_day $month_days)

    display_date "$format" $year $month $day
  done
}


#Please enter the number of counts to be printed during running the code
#Ex: ./date_random.sh 50

rand_date $count "$format"
