#!/bin/bash


if [ $(whoami) != 'root' ]; then
  echo "Sorry, you needs 'root' privileges."
  exit 1
fi

node_ip=$(hostname -i)
node_if=$(ip -f inet addr | grep -B1 ${node_ip} | head -n1 | sed "s/ //g" | cut -f2 -d ':')
echo "The node IP is ${node_ip}. It seems, the name of the network interface is ${node_if}."
echo "Initial network interface configuration is:"
ip -f inet addr show dev ${node_if}
if [ $? -ne 0 ]; then
  echo "Could't guess the interface name... abort"
  exit 1
fi

printf "Please enter the additional IP address for the mail server: "
read additional_ip
echo "Try it on..."
ping -c 1 ${additional_ip}
if [ $? -eq 0 ]; then
  echo "IP adress has already used... abort"
  exit 1
fi

echo "Try to add mail server IP ${additional_ip}..."
printf "network:\n ethernets:\n  ${node_if}:\n   addresses:\n   - ${additional_ip}/32\n" > /etc/netplan/91-maild.yaml
netplan apply
if [ $? -ne 0 ]; then
  echo "Could't apply network settings... abort"
  rm -rf /etc/netplan/91-maild.yaml
  exit 1
fi

sleep 1
echo "Modified network interface configuration is:"
ip -f inet addr show dev ${node_if}
