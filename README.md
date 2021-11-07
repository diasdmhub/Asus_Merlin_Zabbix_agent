# Zabbix Agent installation script for Asus WRT Merlin Routers

If you want to monitor your Asus SOHO router using a Zabbix agent, this script offers some fast way to install the Zabbix Agent and start monitoring items.


### REQUIREMENTS

<UL>
  <LI>Asus WRT Router with Merlin firmware
  <LI>Entware installed
  <LI>Have no previous installation for Zabbix Agent to avoid configuration error
  <LI><a href="https://www.snbforums.com/threads/rt-ac86u-with-zabbix-agent.64343/#post-645193">Read Zabbix Agent forum discussion</a>
</UL>


### USAGE

Copy the script to your router "/jffs/scripts/" directory and start it:
<i>
<UL>
  <LI><code>wget -qO /jffs/scripts/zbx_ag_inst_awrt.sh https://git.io/JXt6I</code>
  <LI><code>chmod +x /jffs/scripts/zbx_ag_inst_awrt.sh</code>
  <LI><code>/jffs/scripts/zbx_ag_inst_awrt.sh [ZABBIX_SERVER_IP_OR_DOMAIN_NAME]</code>
</UL>
</i>


<strong><p>* Change <i><code>[ZABBIX_SERVER_IP_OR_DOMAIN_NAME]</code></i> for your own valid Zabbix server IP address or domain name.</strong>

<BR><strong><a href="https://github.com/diasdmhub/Zabbix_Template_Asus_Merlin">TRY OUT MY ASUS WRT ROUTER TEMPLATE</a></strong>

<strong>TESTED AS IS</strong>
<strong><i>
  <BR>This script was tested only with Asus RT-AC86U / RT-AC87U / RT-AX86U router running a Asus Merlin firmware.
  <BR>It should work with other Asus routers as well.
  <BR>Feedbacks are welcome.
</i></strong>
