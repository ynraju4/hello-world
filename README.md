# maven-project

AWS Linux Server Creation with timcat user

#!/bin/bash
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd restart
sudo echo 'root:manager' | chpasswd
hostname tomcat01
sudo groupadd  admin
sudo sed -i -e 's/%wheels/%admin/g' /etc/sudoers
sudo useradd -g admin -d /home/tomcat tomcat
sudo echo 'tomcat:manager' | chpasswd
sudo sed -i '$ a tomcat         ALL=(ALL)       NOPASSWD: ALL' /etc/sudoers
sudo yum-config-manager --enable rhui-REGION-rhel-server-extras
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo yum install docker -y
sudo service docker start
#----------------------------
##########Clearning docker contanters and docker images with name maven_demo###############
docker stop maven_demo; docker rm -f maven_demo; docker image rm -f maven_demo; cd /opt/docker; docker build -t maven_demo .

########## Starting container with Hello-World Prject and Tomcat Server together#############
docker run -d --name maven_demo -p 8005:8080 maven_demo
