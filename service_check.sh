#!/bin/bash

service_name="nginx"

echo "Do you want to check the status? (yes/no)"
read -p "answer yes or no: " answer

if [ $answer == 'yes' ]; then
	echo "Checking service status...."
	systemctl status "$service_name"
else
	echo "Skipped"
fi
