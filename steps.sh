#!/bin/bash

# Reference URL:- https://phoenixnap.com/kb/install-jenkins-ubuntu

# update the system, Install pip, Install Jave
sudo apt-get update -y && sudo apt-get install python3-pip -y && sudo apt install openjdk-11-jdk -y

# Reference URL:- https://www.jenkins.io/blog/2023/03/27/repository-signing-keys-changing/
# Add Jenkins Repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update -y && sudo apt install jenkins -y && sudo systemctl status jenkins 
# If not active or running then run:- sudo systemctl enable --now jenkins


# Modify Firewall to Allow Jenkins
sudo ufw allow 8080 && sudo ufw status && sudo ufw enable -y

# Set up Jenkins
# go to the server ip OR domain name :- http://ip_address_or_domain:8080
# get the admin passcode 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


# Create a custom domain :- jenkins.chinmaykubalprojects.tech
# website name:- http://jenkins.chinmaykubalprojects.tech/

# Reference Link:- https://github.com/yeshwanthlm/installing-jenkins/blob/main/README.md#2-how-to-configure-and-run-jenkins-behind-apache-reverse-proxy

# Install Apache
sudo apt-get update && sudo apt-get install apache2 -y

# Enable proxy, proxy_http, headers module
sudo a2enmod proxy && sudo a2enmod proxy_http && sudo a2enmod headers &&sudo systemctl restart apache2

# Edit Apache Configuration file 
cd /etc/apache2/sites-available/
sudo vim jenkins.conf

# Enable and Restart Jenkins
sudo a2ensite jenkins
sudo systemctl restart apache2
sudo systemctl restart jenkins

# Configuring Firewall
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable

# Configure Jenkins User
sudo visudo
jenkins ALL=(ALL:ALL) NOPASSWD:ALL


# Now go to Route 53 -> Hosted Zones -> Create hosted zone -> then Domain name and description is :- chinmaykubalprojects.tech -> its a Public hosted zone -> then Click on Create hosted zone. -> then use all the details and use it in the Nameservers in hostinger. (Make sure to backup the default Nameservers provided by hostinger) -> then create record in the aws.

# How to run pipeline:- 