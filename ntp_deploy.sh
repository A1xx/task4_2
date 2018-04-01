#! /bin/bash
apt-get update;
apt-get install ntp -f -y;
sed -i.bak '/pool/d' /etc/ntp.conf;
echo "pool ua.pool.ntp.org" >> /etc/ntp.conf;
cp /etc/ntp.conf /etc/ntp_etalon.conf -f;
echo "*/1 * * * * root ntp_verify.sh" >> /etc/crontab;
cp ./ntp_verify.sh /usr/bin/ntp_verify.sh;
