#! /bin/bash
str=$(diff /etc/ntp.conf /etc/ntp_etalon.conf); 
if [ -n  "$str" ] ;
then echo -e "NOTICE: /etc/ntp.conf was changed.\n"$str"\nRecovering config...";
cp -f /etc/ntp_etalon.conf /etc/ntp.conf;
echo -e "\nRestarting service...";
/etc/init.d/ntp restart;
else str="stay tuned"
fi


