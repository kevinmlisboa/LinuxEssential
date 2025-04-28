#!/bin/bash

set -x  

check_updates() {
    echo "Checking for system updates..."
    sudo apt update && sudo apt list --upgradable
    if [ $? -ne 0 ]; then
        echo "Error: Unable to check system updates."
    fi
}

check_network_connections() {
    echo "Displaying active network connections..."
    ss -tuln
    if [ $? -ne 0 ]; then
        echo "Error: Unable to display network connections."
    fi
}

check_recent_files() {
    echo "Listing files modified in the last 24 hours..."
    find /home -type f -mtime -1
    if [ $? -ne 0 ]; then
        echo "Error: Unable to list recent files."
    fi
}

check_updates
check_network_connections
check_recent_files

set +x  # Disable debug mode after script execution
