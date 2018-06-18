#!/bin/bash

who_log=$(who | awk '{printf("%s", NR == 1 ? $1 : ","$1);} END {printf("\n");}')
date_f=$(date +"[%a %b %d %T %Y]")

if [[ $who_log ]]
then
  echo "$date_f Users logged: $who_log" >> /home/sg_grey/test/task2/log/who.log
else
  echo "$date_f No users currently logged" >> /home/sg_grey/test/task2/log/who.log
fi
