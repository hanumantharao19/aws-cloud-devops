#!/bin/bash

INSTANCE_ID=$1
PUBLIC_IP=$2

echo "================================" > server-details.txt
echo "EC2 SERVER DETAILS" >> server-details.txt
echo "================================" >> server-details.txt
echo "Instance ID : $INSTANCE_ID" >> server-details.txt
echo "Public IP   : $PUBLIC_IP" >> server-details.txt
echo "Status      : Server Ready" >> server-details.txt
