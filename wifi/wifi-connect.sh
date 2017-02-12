#!/bin/bash

# start demon
#wpa_supplicant -u -s -O /var/run/wpa_supplicant

wpa_cli

> scan
OK
<3>CTRL-EVENT-SCAN-RESULTS

> scan_results
bssid / frequency / signal level / flags / ssid
00:00:00:00:00:00 2462 -49 [WPA2-PSK-CCMP][ESS] MYSSID
11:11:11:11:11:11 2437 -64 [WPA2-PSK-CCMP][ESS] ANOTHERSSID

> add_network
0

> set_network 0 ssid "MYSSID"

> set_network 0 psk "passphrase"

> enable_network 0
<2>CTRL-EVENT-CONNECTED – Connection to 00:00:00:00:00:00 completed (reauth) [id=0 id_str=]

> save_config
OK

dhcpcd wlan0

##########################################

wpa_passphrase MYSSID passphrase

# network={
#     ssid="MYSSID"
#     #psk="passphrase"
#     psk=59e0d07fa4c7741797a4e394f38a5c321e3bed51d54ad5fcbd3f84bc7415d73d
# }

# another method
wpa_supplicant -B -i имя_интерфейса -c <(wpa_passphrase MYSSID passphrase)
