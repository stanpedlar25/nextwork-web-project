#!/bin/bash
echo "Stopping services..."

# Stop HTTPD if running
if pgrep httpd > /dev/null; then
    sudo systemctl stop httpd
    echo "HTTPD stopped."
fi

# Stop Tomcat if running
if systemctl list-units --full -all | grep -q tomcat.service; then
    sudo systemctl stop tomcat
    echo "Tomcat stopped."
fi

echo "All services stopped."


