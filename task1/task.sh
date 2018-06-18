#!/bin/bash

#print first and last name from predefined variable

task_1 () {
name='Andrii Maznytsia'
echo "Username: ${USER}. Predefined first and last names: ${name}."
echo "Total characters contained: ${#name}."
}

#print first and last name from arguments

task_2 () {
echo "You've passed the following first and last names as arguments: $1 $2"
}

#function, that returns first and last names in specific format

task_3 () {
read -p "Enter first name: " fname
read -p "Enter last name: " lname
echo "First name is $fname, last name is $lname"
}

#basic arithmetic operation

task_4 () {
if [[ "$3" == 0 ]]
then echo "Denominator can't be zero. Try again with different 3rd number."
else
sum=$(( ($1+$2)/$3 ))
echo $sum
fi
}

#error log operations

task_5 () {
grep "PHP Notice" error.log > notices.txt
echo "$(wc -l notices.txt|cut -d' ' -f1) notices written to notices.txt"

grep -E "PHP Notice.*Undefined variable" error.log > undvars.txt
echo "$(wc -l undvars.txt|cut -d' ' -f1) notices(undefined variable) written to undvars.txt"

grep -E "PHP Notice.*Undefined offset" error.log > undoffsets.txt
echo "$(wc -l undoffsets.txt|cut -d' ' -f1) notices(undefined offset) written to undoffsets.txt"

grep "PHP Warning" error.log > warnings.txt
echo "$(wc -l warnings.txt|cut -d' ' -f1) warnings written to warnings.txt"
}

#access log operations

task_6 () {
echo "$(grep -E "bot|sitemap" access.log | wc -l) overall bot requests found"

sitemap=$(grep "sitemap" access.log | wc -l)
robots=$(grep "robots.txt" access.log | wc -l)
robot=$(( $(grep "robot" access.log | wc -l) - $robots ))
bot=$(( $(grep "bot" access.log | wc -l) - $robots - $robot ))
echo "sitemap requests found: $sitemap" > stats.txt
echo "robots.txt requests found: $robots" >> stats.txt
echo "robot requests found: $robot" >> stats.txt
echo "bot requests found: $bot" >> stats.txt
echo "stats.txt written"
}

#menu assembly

case $1 in
   1) task_1 ;;
   2) task_2 "$2" "$3";;
   3) task_3 ;;
   4) task_4 "$2" "$3" "$4";;
   5) task_5 ;;
   6) task_6 ;;
   help)
   echo "Pass the task number as argument(1/2/3/4/5/6), e.g.: task.sh 3"
   echo "If additional arguments needed, specify them after, e.g.: task.sh 2 Tom Smith"
   ;;
   *)
   echo "Incorrect argument. Run \"task.sh help\" for usage info."
   ;;
esac 

