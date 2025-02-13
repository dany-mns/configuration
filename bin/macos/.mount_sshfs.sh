#!/bin/bash

# Wait a few seconds to ensure network is available
sleep 10

# Create mount directory if it doesn't exist
mkdir -p ~/mnt/mydrive

# Mount SSHFS
shfs danym@ds:/mnt/mydrive ~/mnt/mydrive -o allow_other,defer_permissions,volname=MyDrive

