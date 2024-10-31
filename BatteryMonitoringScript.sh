#!/bin/bash

battery_res=`acpi -b`


read -ra battery_val <<< $battery_res

val=${battery_val[4]::-1}
temp=`echo $val | grep "%"`
if [ $? == 0 ]
then 
val=${val::-1}
fi
echo $val

while [ true ]
do
   if [ $val -lt 15 ]
   then
   notify-send "please put your charge as battery less than 15%"
   sleep 5
   acpi -a | grep "on"
   if [ $? -eq 0 ]
   then
   notify-send "thank you for charging"
   break
   fi
   fi
done   
