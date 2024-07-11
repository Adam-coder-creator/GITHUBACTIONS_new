#!/bin/bash
#Step 1 : Update the machine

    sudo apt-get update -y

#Step 2 : Install apache server and php
   
    sudo apt-get install apache2 libapache2-mod-php -y

#Step 3 : Install mysql server
    
    sudo apt-get install mysql-server -y

#Step 4 : Install php modules
    
    sudo apt-get install php php-mbstring php-gd php-xml php-bcmath php-ldap php-mysql -y

#Step 5 : Install zabbix repository  
    
    sudo wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu24.04_all.deb
    
    sudo dpkg -i zabbix-release_7.0-2+ubuntu24.04_all.deb
    
    sudo apt update

#Step 6 : Install Zabbix server, frontend, agent  
    
    sudo  apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

#Step 7 : Create initial database 
            
            mysql -uroot -p"password"
            
            mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
            
            mysql> create user zabbix@localhost identified by 'password';
            
            mysql> grant all privileges on zabbix.* to zabbix@localhost;
            
            mysql> set global log_bin_trust_function_creators = 1;
            
            mysql> quit;  
        
        On Zabbix server host import initial schema and data. You will be prompted to enter your newly created password:

        sudo zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix

#Step 8 : Disable log_bin_trust_function_creators option after importing database schema.

            mysql -uroot -p"password"

            mysql> set global log_bin_trust_function_creators = 0;

            mysql> quit;
         

#Step 9: Configure the database for Zabbix server (Edit file /etc/zabbix/zabbix_server.conf)
    cat > /etc/zabbix/zabbix_server.conf <EOF
    {
        DBPassword=password
        }

    EOF 

#Step 10: Start Zabbix server and agent processes  

    sudo systemctl restart zabbix-server zabbix-agent apache2 

    sudo systemctl enable zabbix-server zabbix-agent apache2
        