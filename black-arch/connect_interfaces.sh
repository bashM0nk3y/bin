#!/bin/bash

### Bring interfaces up

# Is enp0s3 (host-only) interface available?
# If so, bring it up..
if ip a | grep -Eq ': enp0s3'; then
    if ! ifconfig | grep -Eq 'enp0s3:'; then
        /bin/ifconfig enp0s3 up
    fi
    if ! ip a | grep -A2 ': enp0s3:' | grep -Eq '^\s*inet\s[0-9.\/]+\sbrd\s[0-9.\/]+'; then
        /bin/dhcpcd enp0s3
    fi
fi

# Is enp0s8 (NAT) interface available?
# If so, bring it up..
if ip a | grep -Eq ': enp0s8:'; then
    if ! ifconfig | grep -Eq 'enp0s8:'; then
        /bin/ifconfig enp0s8 up
    fi
    if ! ip a | grep -A2 ': enp0s8:' | grep -Eq '^\s*inet\s[0-9.\/]+\sbrd\s[0-9.\/]+'; then
        /bin/dhcpcd enp0s8
    fi
fi

# Is wlp0s11u1 (wireless) interface available?
# If so, bring it up..
if ip a | grep -Eq ': wlp0s11u1:'; then
    if ! ifconfig | grep -Eq 'wlp0s11u1:'; then
        /bin/ifconfig wlp0s11u1 up
    fi
    if ! ip a | grep -A2 ': wlp0s11u1:' | grep -Eq '^\s*inet\s[0-9.\/]+\sbrd\s[0-9.\/]+'; then
        /bin/wpa_supplicant -B -i wlp0s11u1 -c /etc/wpa_supplicant/wpa_supplicant.conf
        /bin/dhclient wlp0s11u1
    fi
fi
