#!/bin/bash
# Install dependencies
sudo yum update -y
sudo yum install -y java-17-openjdk wget httpd

# Create Tomcat user
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat

# Download and install Tomcat
TOMCAT_VERSION=9.0.99
wget https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -P /tmp
sudo mkdir -p /opt/tomcat
sudo tar xf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C /opt/tomcat --strip-components=1
sudo chown -R tomcat:tomcat /opt/tomcat

# Create systemd service for Tomcat
sudo bash -c 'cat > /etc/systemd/system/tomcat.service << EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment=JAVA_HOME=/usr/lib/jvm/jre-17-openjdk
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd and enable services
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl enable httpd

# Configure Apache as reverse proxy
sudo bash -c 'cat > /etc/httpd/conf.d/tomcat_manager.conf << EOF
<VirtualHost *:80>
    ServerAdmin root@localhost
    ServerName app.nextwork.com
    DefaultType text/html
    ProxyRequests off
    ProxyPreserveHost On
    ProxyPass / http://localhost:8080/nextwork-web-project/
    ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF'

echo "Dependencies installed, Tomcat and HTTPD configured."


