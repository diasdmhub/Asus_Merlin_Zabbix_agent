<div align="center">
	<h1>Zabbix Agent installation script for Asus WRT Merlin Routers</h1>
</div>

<BR>

---

If you want to monitor your Asus SOHO router using a Zabbix agent, this script provides a quick way to install the Zabbix Agent and start monitoring items.

---

<BR>

### REQUIREMENTS

- Asus WRT Router with Merlin firmware
- Entware installed
- Clear Zabbix Agent configuration file to avoid configuration errors
- [Read Zabbix Agent forum discussion](https://www.snbforums.com/threads/rt-ac86u-with-zabbix-agent.64343/#post-645193)

<BR>

### USAGE

Copy the script to your router `/jffs/scripts/` directory and start it with your Zabbix server as argument.

1. `wget -qO /jffs/scripts/zbx_ag_inst_awrt.sh https://git.io/JXt6I`
2. `chmod +x /jffs/scripts/zbx_ag_inst_awrt.sh`
3. `/jffs/scripts/zbx_ag_inst_awrt.sh [ZABBIX_SERVER_IP_OR_DOMAIN_NAME]`

> _Change `[ZABBIX_SERVER_IP_OR_DOMAIN_NAME]` for your own valid Zabbix server IP address or domain name._

<BR>

↗️ [TRY OUT MY ASUS WRT ROUTER TEMPLATE](https://github.com/diasdmhub/Zabbix_Template_Asus_Merlin)

<BR>

### TESTED AS IS

This script was tested only with Asus RT-AC86U / RT-AC87U / RT-AX86U routers running an Asus Merlin firmware. \
It should work with other Asus routers as well. \
Feedbacks are welcome.
