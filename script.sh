#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Prompt the user for an option
echo "Welcome to the reconnaissance script!"
echo "Please select an option:"
echo "1. Host scan"
echo "2. Port scan"
echo "3. Version scan"
echo "4. OS detection"
echo "5. Banner grabbing"
read -p "Enter your choice (1-5): " option

# Validate the user's choice
if ! [[ "$option" =~ ^[1-5]$ ]]; then
  echo "Invalid choice. Exiting..."
  exit 1
fi

# Perform the selected action
if [[ "$option" == "1" ]]; then
  # Host scan
  read -p "Enter the IP address or range to scan: " ip_address
  if command_exists nmap; then
    nmap -sn "$ip_address"
  else
    echo "Nmap is not installed. Please install Nmap and try again."
    exit 1
  fi
elif [[ "$option" == "2" ]]; then
  # Port scan
  read -p "Enter the IP address to scan: " ip_address
  if command_exists nmap; then
    nmap -p- "$ip_address"
  else
    echo "Nmap is not installed. Please install Nmap and try again."
    exit 1
  fi
elif [[ "$option" == "3" ]]; then
  # Version scan
  read -p "Enter the IP address to scan: " ip_address
  if command_exists nmap; then
    nmap -sV -p- "$ip_address"
  else
    echo "Nmap is not installed. Please install Nmap and try again."
    exit 1
  fi
elif [[ "$option" == "4" ]]; then
  # OS detection
  read -p "Enter the IP address to scan: " ip_address
  if command_exists nmap; then
    nmap -O "$ip_address"
  else
    echo "Nmap is not installed. Please install Nmap and try again."
    exit 1
  fi
elif [[ "$option" == "5" ]]; then
  # Banner grabbing
  read -p "Enter the IP address: " ip_address
  read -p "Enter the port: " port
  if command_exists bannergrab; then
    bannergrab "$ip_address" "$port"
  else
    echo "BannerGrab is not installed. Please install BannerGrab and try again."
    exit 1
  fi
fi

echo "Task completed successfully."

