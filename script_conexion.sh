#!/bin/bash
#
# Script de encendido y conexión directa a máquina virtual Proxmox 5.x - 6.x
#

#Parametros de conexión
USERNAME="druiarr@pve"
PASSWORD=""
PROXY="proxmox.servidor.com"
NODE=""
VMID=""

#Obtenemos token de sesión
DATA=$(curl -f -s -S -k -d "username=$USERNAME&password=$PASSWORD"  https://$PROXY:8006/api2/json/access/ticket)

TICKET=${DATA//\"/}
TICKET=${TICKET##*ticket:}
TICKET=${TICKET%%,*}

CSRF=${DATA//\"/}
CSRF=${CSRF##*CSRFPreventionToken:}
CSRF=${CSRF%%,*}

# Encendemos la máquina virtual (si queremos apagarla seria cambiar start por stop o shutdown)
curl -f -s -S -k -X POST -b "PVEAuthCookie=$TICKET" -H "CSRFPreventionToken: $CSRF" https://$PROXY:8006/api2/json/nodes/$NODE/qemu/$VMID/status/start > /dev/null

# Esperamos a que se encienda
sleep 4

# Pedimos spiceproxy y lo guardamos en un archivo
curl -f -s -S -k -X POST -b "PVEAuthCookie=$TICKET" -H "CSRFPreventionToken: $CSRF" https://$PROXY:8006/api2/spiceconfig/nodes/$NODE/qemu/$VMID/spiceproxy -d "proxy=$PROXY" > spiceproxy

# Ejecutamos spiceproxy
remote-viewer spiceproxy