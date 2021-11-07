#!/bin/sh

# ZABBIX AGENT INSTALATION FOR ASUS WRT ROUTER
# https://github.com/diasdmhub/Zabbix_agent_Asus_Merlin
# v1
# by Diasdm


#001 VAR

SCRIPTDIR="/jffs/scripts"
SCRIPTNAME="zbx_ag_inst_awrt.sh"

CONF_FILE="zabbix_agentd.conf"
CONF_DIR="/opt/etc"
CONF_ASUS="asus_$CONF_FILE"

ZBXAGFIND=$(opkg find zabbix-agentd)  # PACKAGE NAME: CHANGE IF NECESSARY.
ZBXAGVERSION=$(echo $ZBXAGFIND | cut -d " " -f 3)
ZBXSERVER=$1  # ATENTION - THIS WILL ACCEPT ANY VALUE


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


#005 INSTALATION

opkg install zabbix-agentd


#006 WRINTING ASUSWRT CONFIGURATION FILE

cp -p $CONF_DIR/$CONF_FILE $CONF_DIR/$CONF_FILE.bkp

sed -i "s/Server=127.0.0.1/Server=$ZBXSERVER/" $CONF_DIR/$CONF_FILE


cat > $CONF_DIR/$CONF_FILE.d/$CONF_ASUS <<- EOF
        # ASUS WRT SPECIFIC OPTIONS FOR ZABBIX AGENT
        # https://github.com/diasdmhub/Zabbix_agent_Asus_Merlin

        Hostname=$HOSTNAME
        AllowKey=system.run[*]
        AllowRoot=1
EOF


#007 STARTING AGENT

$CONF_DIR/init.d/S07zabbix_agentd start

ZBXAGSTATUS=$(/opt/etc/init.d/S07zabbix_agentd check | awk '{print $5}')
echo -e "ZABBIX AGENT IS $ZBXAGSTATUS\n"

exit 0;
