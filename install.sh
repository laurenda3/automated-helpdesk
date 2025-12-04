#!/bin/bash

# Automated Help Desk Installation Script (osTicket)
# Author: Laurenda
# Description: Automates the installation of Apache, MySQL, PHP, and osTicket on Ubuntu.

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Automated Help Desk Installation...${NC}"

# 1. Update System
echo -e "${GREEN}[+] Updating system packages...${NC}"
sudo apt-get update -y && sudo apt-get upgrade -y

# 2. Install Dependencies (LAMP Stack + Extensions)
echo -e "${GREEN}[+] Installing Apache, MySQL, PHP, and extensions...${NC}"
sudo apt-get install -y apache2 mysql-server php php-mysql php-cgi php-fpm php-cli php-curl php-gd php-imap php-mbstring php-xml php-intl php-apcu unzip wget

# 3. Enable Apache Modules
echo -e "${GREEN}[+] Enabling Apache rewrite module...${NC}"
sudo a2enmod rewrite
sudo systemctl restart apache2

# 4. Download osTicket
echo -e "${GREEN}[+] Downloading osTicket...${NC}"
cd /var/www/html
sudo wget https://github.com/osTicket/osTicket/releases/download/v1.17.2/osTicket-v1.17.2.zip
sudo unzip osTicket-v1.17.2.zip
sudo rm osTicket-v1.17.2.zip

# 5. Set Permissions
echo -e "${GREEN}[+] Setting file permissions...${NC}"
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

echo -e "${GREEN}Installation Complete! Please run configure.sh to set up the database.${NC}"
