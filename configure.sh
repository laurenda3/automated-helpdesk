#!/bin/bash

# Automated Help Desk Configuration Script
# Author: Lauren
# Description: Configures MySQL database and osTicket settings.

GREEN='\033[0;32m'
NC='\033[0m'

DB_NAME="osticket_db"
DB_USER="osticket_user"
DB_PASS="SecurePass123!"

echo -e "${GREEN}Starting Configuration...${NC}"

# 1. Configure Database
echo -e "${GREEN}[+] Creating MySQL Database and User...${NC}"
sudo mysql -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# 2. Configure osTicket Config File
echo -e "${GREEN}[+] Configuring osTicket settings...${NC}"
cd /var/www/html/upload/include
sudo cp ost-sampleconfig.php ost-config.php
sudo chmod 0666 ost-config.php

echo -e "${GREEN}Configuration Complete!${NC}"
echo -e "${GREEN}Access your Help Desk at: http://localhost/upload${NC}"
