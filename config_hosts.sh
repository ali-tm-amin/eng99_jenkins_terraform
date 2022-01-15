#!/bin/bash
echo -e "[app]\nec2-instance ansible_host=$(terraform output app_ip) ansible_user=ubuntu" | sed 's/"//g' > hosts.inv
echo -e "[db]\nec2-instance ansible_host=$(terraform output db_ip) ansible_user=ubuntu" | sed 's/"//g' > hosts.inv

output"app_ip" {value=aws_instance.app_instance.public_ip}
output"db_ip" {value=aws_instance.db_instance.public_ip}

# echo "[app]\n$(terraform output app_ip) ansible_user=ubuntu" | sed 's/"//g' > hosts.inv
# echo "[db]\n$(terraform output db_ip) ansible_user=ubuntu"  | sed 's/"//g' >> hosts.inv