#!/bin/bash

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME
echo
echo "CPU:"
nproc
echo
echo "Memory:"
free -h
echo
echo "System information completed successfully"
