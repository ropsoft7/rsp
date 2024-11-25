#!/bin/bash

# Function to display available Wi-Fi SSIDs
list_wifi_networks() {
  echo "Available Wi-Fi Networks:"
  nmcli dev wifi list
}

# Function to connect to a Wi-Fi network
connect_to_wifi() {
  echo "Enter the name (SSID) of the Wi-Fi network you want to connect to:"
  read ssid

  echo "Enter the password for the Wi-Fi network:"
  read -s password

  # Use nmcli to connect to the specified Wi-Fi network
  sudo nmcli dev wifi connect "$ssid" password "$password"
}

# Display available Wi-Fi networks (function call)
list_wifi_networks

# Option to connect to a Wi-Fi network
echo "Do you want to connect to a Wi-Fi network? (yes/no):"
read choice

if [ "$choice" = "yes" ]; then
        #call connect wifi function
      	connect_to_wifi
else
  echo "No network connection requested. Exiting."
fi

