#!/bin/bash
#
# Install OpenVPN profiles in NetworkManager for PIA
#

error() {
        echo $@ >&2
        exit 255
}

if [ "$(whoami)" != "root" ]; then
        error "This script needs to be run as root. Try again with 'sudo $0'"
fi

pkgerror="Failed to install the required packages, aborting."

pia_username=p0480352

echo -n "Connection method (UDP/tcp): "
read pia_tcp

case "$pia_tcp" in
        U|u|UDP|udp|"")
                pia_tcp=no
                ;;
        T|t|TCP|tcp)
                pia_tcp=yes
                ;;
        *)
                error "Connection protocol must be UDP or TCP."
esac

echo "Encryption Strength:"
echo "  1) AES-128, RSA-2048, SHA1"
echo "  2) AES-128, RSA-2048, SHA-256"
echo "  3) AES-128, RSA-4096, SHA-256"
echo "  4) AES-256, RSA-4096, SHA-256"
echo -n "Choose 1 - 4:"
read pia_strong

echo "Installing OpenVPN Profiles..."

case "$pia_strong" in
        1)
                pia_cert=ca.rsa.2048.crt
                pia_cipher=AES-128-CBC
                pia_auth=SHA1

                if [ "$pia_tcp" = "yes" ]; then
                        pia_port=502
                else
                        pia_port=1198
                fi
                ;;
        2)
                pia_cert=ca.rsa.2048.crt
                pia_cipher=AES-128-CBC
                pia_auth=SHA256

                if [ "$pia_tcp" = "yes" ]; then
                        pia_port=502
                else
                        pia_port=1198
                fi
                ;;
        3)
                pia_cert=ca.rsa.4096.crt
                pia_cipher=AES-128-CBC
                pia_auth=SHA256

                if [ "$pia_tcp" = "yes" ]; then
                        pia_port=502
                else
                        pia_port=1197
                fi
                ;;
        4)
                pia_cert=ca.rsa.4096.crt
                pia_cipher=AES-256-CBC
                pia_auth=SHA256

                if [ "$pia_tcp" = "yes" ]; then
                        pia_port=501
                else
                        pia_port=1197
                fi
                ;;

        *)
                error "Strong encryption must be on or off."
esac

##
# Download and install
curl -sS -o "/etc/openvpn/pia-$pia_cert" \
        "https://www.privateinternetaccess.com/openvpn/$pia_cert" \
        || error "Failed to download OpenVPN CA certificate, aborting."

IFS=$(echo)
servers=$(curl -Ss "https://www.privateinternetaccess.com/vpninfo/servers?version=24" | head -1)

if [ -z "$servers" ]; then
        error "Failed to download server list, aborting."
fi

rm -f "/etc/NetworkManager/system-connections/PIA - "*

servers=$(python2.7 <<EOF
import sys
import json
data = json.loads('$servers')

for k in data.keys():
        if k != "info":
                print data[k]["dns"] + ':' + data[k]["name"]
EOF
)

echo "$servers" | while read server; do
        host=$(echo "$server" | cut -d: -f1)
        name="PIA - "$(echo "$server" | cut -d: -f2)
        nmfile="/etc/NetworkManager/system-connections/$name"

        cat <<EOF > "$nmfile"
[connection]
id=$name
uuid=$(uuidgen)
type=vpn
autoconnect=false

[vpn]
service-type=org.freedesktop.NetworkManager.openvpn
username=$pia_username
comp-lzo=yes
remote=$host
cipher=$pia_cipher
auth=$pia_auth
connection-type=password
password-flags=1
port=$pia_port
proto-tcp=$pia_tcp
ca=/etc/openvpn/pia-$pia_cert

[ipv4]
method=auto
EOF
        chmod 0600 "$nmfile"
done

nmcli connection reload || \
        error "Failed to reload NetworkManager connections: installation was complete, but may require a restart to be effective."

echo "Installation is complete!"
