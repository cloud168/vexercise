#!/bin/bash
#voyager exercise 1

if ( ! getopts ":c:w:e:" opt); then
  echo "Caution: Parameters -c (n) -w (n) -e (email add) are required! n=number"
  exit
fi

while getopts ":c:w:e:" opt; do
  case $opt in
    c) critical="$OPTARG"
    ;;
    w) warning="$OPTARG"
    ;;
    e) email="$OPTARG"
    ;;
    \?) echo "Caution: Invalid option -$OPTARG" >*2
    exit
    ;;
    :) echo "Caution: -$OPTARG requires a parameter!" >&2
    exit
    esac
    done
    
function memoryused {
  echo "$USAGE_MEMORY% is being used!"
  }
  
function legend {
  echo "2=used memory>=critical / 1=critical>used memory<=warning / 0=used memory>warning"
  }
  
function sendthemail {
  MAIL_CONTAINER=$( ps -eo pmem,vsize,pid,cmd | sort -k 1 -nr | head -10)
  SUBJECT=$( date +"%Y%m%d %H:%M memory check - critical" )
  FROM="DONOTREPLY"
  echo $MAIL_CONTAINER | mailx - s "$SUBJECT" $email -- -f $FROM
  }
  
function checkmem {
  TOTAL_MEMORY=$( free -m | grep Mem: | awk '{print $2 }' )
  TOTAL_USED=$( free -m | grep Mem: | awk '{ print $3 }' )
  TOTAL_FREE=$( free -m | grep Mem: | awk '{ print $4 }' )
  
  USAGE_MEMORY=$((100*TOTAL_USED/TOTAL_MEMORY))
  
  if [ "$USAGE_MEMORY" -ge "$critical" ]; then
    echo"2"
    memoryused
    legend
    sendthemail
    echo "Mail sent to e-mail provided!"
    exit 2
  elif [[ "$USAGE_MEMORY" -ge "$warning" && "$USAGE_MEMORY" -lt "$critical" ]]; then
    echo "1"
    memoryused
    legend
    exit 1
  elif [ "$USAGE MEMORY" -lt "$critical" ]; then
    echo "0"
    memoryused
    legend
    exit 0
  else
    memoryused
  fi
#echo $TOTAL_MEMORY $TOTAL_USED $TOTAL_FREE
#echo $USAGE_MEMORY"% of memory is used!"
}

if [[ ! "$critical" =~ ^([0-9]+); then
  echo "Caution: Critical threshold value only accepts numbers!"
  exit
elif [[ ! "$warning" =~ ^([0-9]+) ]]; then
  echo "Caution: Warning threshold value only accepts numbers!"
  exit
elif [ $critical -le $warning ]; then
  echo "Caution: Critical (-c) must be greater than Warning (-w)!"
  exit
else checkmem
fi

  











 
    
