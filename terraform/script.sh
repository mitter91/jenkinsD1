#!/bin/bash
until [[ "$rez" = "0%" ]]
do
rez=$(ping -c 1 8.8.8.8 | grep % | cut -d ' ' -f6)
echo "No internet"
done
echo "Internet is here"
yum update -y
yum install epel-release -y
yum install git -y
yum install ansible -y
git clone https://github.com/mitter91/jenkinsD1.git
ansible-playbook ./jenkinsD1/ansible/jenkins.yml