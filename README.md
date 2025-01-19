Seting up Cloud Infastructure for migrating a multi tiers app fully hosted on aws.

Tickets
1- Create a vpc for utc app with below specs:
name: utc-app1
Tenancy: default
NAT Gateway: 1
s3 endpoint: no
CIDR: 172.120.0.0/16
enable IPV6: No
Enable DNS hostnames: yes
Enable DNS resolution: yes
Internet Gateway name: dev-wdp-IGW
Attach the Internet Gateway to the VPC
two public subnets
two private subnets
tags: {
Name: utc-app1
env:  dev
team: wdp
created by: Yourname
}

2- 2- Create a security group for utc app:
    name: webserver-sg
    ports: 
      
22 for ssh, allow just from your ip 
80 for apache, open to the world
8080 open everywhere
vpc: utc-app1

3- create a ssh keypair for utc app :
    name: utc-key
    format: .pem

4- create an ec2 instance with below specs:
    ami: ami-0195204d5dce06d99
    hardrive / ebs: 20g 
    security group: webserver-sg
    enable public ip: yes
    key_name: utc-key
    vpc: utc-app1
    subnet: public-subnet-1a
    user data: 
   #!/bin/bash
   sudo  yum update -y
   sudo   groupadd docker
   sudo   useradd John -aG docker 
   sudo   yum install git unzip wget httpd -y
   sudo   systemctl start httpd
   sudo   systemctl enable httpd
   sudo   cd /opt
   sudo   wget 
   https://github.com/kserge2001/web-consulting/archive/refs/heads/dev.zip
   sudo   unzip dev.zip
   sudo   cp -r /opt/web-consulting-dev/* /var/www/html

      tags = {
        Name: utc-dev-inst
        Team: Cloud Transformation
        Environment: Dev
        Created by: your name goes here
      }

5- testing:
  check the vpc and subnets
  check the keypair
  check the security group
  check the instance ( login and verify that user data run)
  Take the ip address of the instance to the browser to verify content

6- create an ami of your utc-dev-inst so next time we dont need to reconfigure the instance.
call it utc-dev-inst
