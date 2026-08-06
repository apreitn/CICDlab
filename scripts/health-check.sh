#!/bin/bash

echo "=== Health Check ==="
echo "Hostname: $(hostname)"
echo "Current user: $(whoami)"
echo "Uptime:"
uptime

echo
echo "Disk usage:"
df -h /

echo
echo "Memory usage:"
free -h

echo
echo "Health check completed successfully"
