#!/bin/bash

# Script: Sensitive file checker
# Author: tdkmp4n4
# Description: This script checks for some sensitive files under actual directory. Make sure you are in the right path before launching it

echo -e "\n"

echo -e "\e[1m·········································································································"
echo -e "·········································································································"
echo -e "··   ____                 _ _   _              __ _ _                  _               _               ··"
echo -e "··  / ___|  ___ _ __  ___(_) |_(_)_   _____   / _(_) | ___  ___    ___| |__   ___  ___| | _____ _ __   ··"
echo -e "··  \___ \ / _ \ '_ \/ __| | __| \ \ / / _ \ | |_| | |/ _ \/ __|  / __| '_ \ / _ \/ __| |/ / _ \ '__|  ··"
echo -e "··   ___) |  __/ | | \__ \ | |_| |\ V /  __/ |  _| | |  __/\__ \ | (__| | | |  __/ (__|   <  __/ |     ··"
echo -e "··  |____/ \___|_| |_|___/_|\__|_| \_/ \___| |_| |_|_|\___||___/  \___|_| |_|\___|\___|_|\_\___|_|     ··"
echo -e "··                                                                                                     ··"
echo -e "··                 ____            _      _ _                    _  _         _  _                     ··"
echo -e "··                | __ ) _   _ _  | |_ __| | | ___ __ ___  _ __ | || |  _ __ | || |                    ··"
echo -e "··                |  _ \| | | (_) | __/ _\` | |/ / '_ \` _ \| '_ \| || |_| '_ \| || |_                   ··"
echo -e "··                | |_) | |_| |_  | || (_| |   <| | | | | | |_) |__   _| | | |__   _|                  ··"
echo -e "··                |____/ \__, (_)  \__\__,_|_|\_\_| |_| |_| .__/   |_| |_| |_|  |_|                    ··"
echo -e "··                       |___/                            |_|                                          ··"
echo -e "·········································································································"
echo -e "·········································································································"

echo -e "\e[0m\n"

echo -e "\e[34m[+] Checking files with word -password- in name\e[0m"
find . -type f -iname "*password*" 2>/dev/null
echo -e "\n"

echo -e "\e[34m[+] Checking files with word -pass- in name\e[0m"
find . -type f -iname "*pass*" 2>/dev/null
echo -e "\n"

echo -e "\e[34m[+] Checking files with word -contraseña- in name\e[0m"
find . -type f -iname "*contraseña*" 2>/dev/null
echo -e "\n"

echo -e "\e[34m[+] Checking files with word -secret- in name\e[0m"
find . -type f -iname "*secret*" 2>/dev/null
echo -e "\n"
