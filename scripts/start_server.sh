#!/bin/bash
echo "Starting services..."

# Start Tomcat
sudo systemctl start tomcat
sudo systemctl enable tomcat
echo "Tomcat started and enabled."

# Start HTTPD
sudo systemctl start httpd
sudo systemctl enable httpd
echo "HTTPD started and enabled."

echo "All services started."
