# Zabbix Agent installation script for Asus WRT Merlin Routers

If you want to monitor your Asus SOHO router using a Zabbix agent, this script offers some fast way to install the Zabbix Agent and start monitoring items.


### REQUIREMENTS

<UL>
  <LI>Asus WRT Router with Merlin firmware
  <LI>Entware installed
  <LI><a href="https://www.snbforums.com/threads/rt-ac86u-with-zabbix-agent.64343/#post-645193">Read Zabbix Agent forum discussion</a>
</UL>


### USAGE

Copy the script to your router and execute it like so:
<i>
<UL>
  <LI>chmod +x /jffs/scripts/zbx_ag_inst_awrt.sh
  <LI>/jffs/scripts/zbx_ag_inst_awrt.sh <ZABBIX_SERVER_IP_OR_DOMAIN_NAME>
</UL>
</i>
<BR>If you prefer to download directly to your router, try this:
<i>
<UL>
  <LI>wget https://github.com/diasdmhub/Zabbix_agent_Asus_Merlin/main/zbx_ag_inst_awrt.sh | sh <ZABBIX_SERVER_IP_OR_DOMAIN_NAME>
</UL>
</i>


<strong><p>* Change "<i><ZABBIX_SERVER_IP_OR_DOMAIN_NAME></i>" for your own Zabbix server IP address or domain name.</strong>
  
<strong><i><p>** Tested as is on a Asus RT-AC86U router.</i></strong>
