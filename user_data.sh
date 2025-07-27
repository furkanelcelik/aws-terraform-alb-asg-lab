#!/bin/bash
# Update packages and install a web server (httpd), aws-cli, and jq
yum update -y
yum install -y httpd aws-cli jq

# Start and enable the httpd service
systemctl start httpd
systemctl enable httpd

# Get a token for IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Get instance metadata using the token
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-ipv4)

# Create the HTML file
echo "<h1>This message was generated on instance $INSTANCE_ID with the following IP: $PRIVATE_IP</h1>" > /var/www/html/index.html
