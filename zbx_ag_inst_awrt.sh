#!/bin/sh

# ZABBIX AGENT INSTALATION FOR ASUS WRT ROUTER
# alpha v1
# by Diasdm


#001 VAR

SCRIPTDIR="/jffs/scripts"
SCRIPTNAME="zbx_ag_inst_awrt.sh"

CONF_FILE="zabbix_agentd.conf"
CONF_DIR="/opt/etc"

ZBXAGFIND=$(opkg find zabbix-agentd)  # PACKAGE NAME: CHANGE IF NECESSARY.
ZBXAGVERSION=$(echo $ZBXAGFIND | cut -d " " -f 3)
ZBXSERVER=$1


#002 CHECK IF ZABBIX AGENT IS AVAILABLE

if [ "$ZBXAGFIND" == "" ]; then
	echo -e "\n**ZABBIX AGENT PACKAGE NOT AVAILABLE**\n\n"
	exit 2;
fi


#003 HEADER NOTE

clear
echo -e "ZABBIX AGENT LATEST VERSION: $ZBXAGVERSION\n"
echo -e "INSTALLING...\n\n"


#004 CHECK IF USER TYPED A ZABBIX SERVER IP/DOMAIN

if [ "$ZBXSERVER" == "" -o "$ZBXSERVER" == " " ]; then
	echo -e "\nNO IP OR DOMAIN NAME WAS SET. TRY AGAIN.\n"
	echo -e "USAGE: $SCRIPTDIR/$SCRIPTNAME <ZABBIX_SERVER_IP_OR_DOMAIN_NAME>\n"
	exit 3;
fi

cp -p ./$SCRIPTNAME $SCRIPTDIR/$SCRIPTNAME


#005 INSTALATION

opkg -V2 install zabbix-agentd


#006 WRINTING ASUSWRT CONFIGURATION FILE

cp -p $CONF_DIR/$CONF_FILE $CONF_DIR/$CONF_FILE.bkp
cp $CONF_DIR/$CONF_FILE /tmp/$CONF_FILE.tmp

sed -i 's/# LogFileSize=1/LogFileSize=1/' /tmp/$CONF_FILE.tmp
sed -i 's/DenyKey=system.run\[\*\]/# DenyKey=system.run\[\*\]/' /tmp/$CONF_FILE.tmp
sed -i 's/# EnableRemoteCommands=0/EnableRemoteCommands=1/' /tmp/$CONF_FILE.tmp
sed -i 's/# LogRemoteCommands=0/LogRemoteCommands=1/' /tmp/$CONF_FILE.tmp
sed -i "s/Server=127.0.0.1/Server=$ZBXSERVER/" /tmp/$CONF_FILE.tmp
sed -i 's/# AllowRoot=0/AllowRoot=1/' /tmp/$CONF_FILE.tmp

cat /tmp/$CONF_FILE.tmp > $CONF_DIR/$CONF_FILE

rm /tmp/$CONF_FILE.tmp


#007 STARTING AGENT

zabbix_agentd -c /opt/etc/zabbix_agentd.conf

ZBXAGSTATUS=$(/opt/etc/init.d/S07zabbix_agentd check | awk '{print $5}')
echo -e "ZABBIX AGENT IS $ZBXAGSTATUS\n"

exit 0;
