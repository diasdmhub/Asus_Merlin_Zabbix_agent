# Zabbix Agent installation script for Asus WRT Merlin Routers

If you want to monitor your Asus SOHO router using a Zabbix agent, this script offers some fast way to install the Zabbix Agent and start monitoring items.


### REQUIREMENTS

<UL>
  <LI>Asus WRT Router with Merlin firmware
  <LI>Entware installed
  <LI><a href="https://www.snbforums.com/threads/rt-ac86u-with-zabbix-agent.64343/#post-645193">Read Zabbix Agent forum discussion</a>
</UL>


### USAGE

Copy the script to your router "/jffs/scripts/" directory and execute it like so:
<i>
<UL>
  <LI>chmod +x /jffs/scripts/zbx_ag_inst_awrt.sh
  <LI>/jffs/scripts/zbx_ag_inst_awrt.sh <ZABBIX_SERVER_IP_OR_DOMAIN_NAME>
</UL>
</i>


<strong><p>* Change "<i><ZABBIX_SERVER_IP_OR_DOMAIN_NAME></i>" for your own Zabbix server IP address or domain name.</strong>

<BR><strong><a href="https://github.com/diasdmhub/Zabbix_Template_Asus_Merlin">TRY OUT MY ASUS WRT ROUTER TEMPLATE</a></strong>

<strong>TESTED AS IS</strong>
<BR>
<strong><i>
  This script was tested only with an Asus RT-AC86U router running an Asus Merlin firmware.
  It should work with other Asus routers as well
  Any feedback are welcome.
</i></strong>
