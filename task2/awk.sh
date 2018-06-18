#!/bin/bash

day=$(echo $1 | cut -d. -f1)
month=$(echo $1 | cut -d. -f2)
year=$(echo $1 | cut -d. -f3)

awk -v a="$year" -v b="$month" -v c="$day" '

BEGIN{
   m=split("Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec",d,"|")
   for(o=1;o<=m;o++){
      months[d[o]]=sprintf("%02d",o)
   }
}

{
   day=$3
   mon=months[$2]
   yr=substr($5, 1, length($5)-1)
 
   if ( yr > a || yr == a && mon > b || yr == a && mon == b && day >= c )
   print $0
}' log/syslog
