#!/bin/bash
set -e

sed -i "s/root=.*/root=$SSMTP_ROOT_MAIL/" /etc/ssmtp/ssmtp.conf    
sed -i "s/mailhub=.*/mailhub=$SSMTP_SMTP_HOST/" /etc/ssmtp/ssmtp.conf
sed -i "s/#rewriteDomain=.*/rewriteDomain=$SSMTP_REWRITEDOMAIN/" /etc/ssmtp/ssmtp.conf
sed -i "s/hostname=.*/hostname=$SSMTP_HOSTNAME/" /etc/ssmtp/ssmtp.conf
sed -i "s/#FromLineOverride=.*/FromLineOverride=YES/" /etc/ssmtp/ssmtp.conf
sed -i "$ a root:$SSMTP_ROOT_MAIL:$SSMTP_SMTP_HOST" /etc/ssmtp/revaliases

exec "$@"
