#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

echo "Welcome to Ultimate Chromebook Optimization Script!"

# Create a timestamped backup directory
backup_dir="/path/to/backups/$(date +%Y%m%d%H%M%S)"
sudo mkdir -p "$backup_dir"

# Backup important files
sudo cp /etc/chrome_dev.conf "$backup_dir/chrome_dev.conf.bak"
sudo cp /usr/share/chromeos-assets/images/gaia_default_wallpaper.jpg "$backup_dir/gaia_default_wallpaper.jpg.bak"
sudo cp /etc/init/crbug-restore.conf "$backup_dir/crbug-restore.conf.bak"
sudo cp /etc/powerd/powerd.conf "$backup_dir/powerd.conf.bak"

# Check if user has developer mode enabled
if [ "$(chromeos-config-print /dev/root | grep -c "Developer")" -eq 0 ]; then
  echo "Developer mode is not enabled. Enabling now..."
  sudo crossystem dev_boot_signed_only=0
  sudo chromeos-setdevpasswd
  echo "Developer mode is now enabled. Reboot and run this script again."
  exit 0
fi

# Enable GPU and CPU experimental features
echo "Enabling experimental GPU and CPU features..."
sudo cp /etc/chrome_dev.conf /etc/chrome_dev.conf.bak
echo "--enable-features=UseOzonePlatform" | sudo tee -a /etc/chrome_dev.conf

# Optimize CPU performance using cpupower
echo "Optimizing CPU performance..."
sudo apt-get install -y cpupower
sudo cpupower frequency-set -g performance

# Optimize Memory Usage
echo "Optimizing memory usage..."
echo "vm.swappiness=$(free | awk '/^Mem:/{print int($3/$2*100)}')" | sudo tee -a /etc/sysctl.conf

# Create a Swap File (Virtual Memory) using swap enable
echo "Creating a swap file for virtual memory..."
sudo swap enable 2000

# Tweak Battery Settings
echo "Tweaking battery settings..."
sudo cp /etc/powerd/powerd.conf /etc/powerd/powerd.conf.bak
echo "USE_OLD_IDLE_HINT=true" | sudo tee -a /etc/powerd/powerd.conf

# Optimize SSD for Performance and Lifespan
echo "Optimizing SSD for performance and lifespan..."
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_ratio=10" | sudo tee -a /etc/sysctl.conf

# Disable Unnecessary Services
echo "Disabling unnecessary services..."
sudo systemctl disable bluetooth
sudo systemctl disable cups
sudo systemctl disable modemmanager
sudo systemctl disable avahi-daemon  # Additional service to disable

# Remove unnecessary packages more aggressively
echo "Reclaiming disk space..."
sudo apt-get autoremove --purge -y
sudo apt-get clean

# Disable Unused Chrome Extensions
echo "Disabling unused Chrome extensions..."
# Replace the following lines with commands to disable specific extensions
# Example: chromeos-setdevpasswd

# Enable Zram for compressed swap space
echo "Enabling Zram for compressed swap space..."
sudo echo "zram" >> /etc/modules

# Tweak Chrome Flags
echo "Tweaking Chrome flags..."
# Add your preferred Chrome flags here
chrome_flags="--flag1 --flag2"

# Update Chrome flags in Chrome OS configuration
sudo sed -i -e "s/CHROMEOS_CFLAGS=.*/CHROMEOS_CFLAGS=\"$chrome_flags\"/" /etc/chrome_dev.conf

# Schedule TRIM for SSDs
echo "Scheduling TRIM for SSDs..."
echo "/etc/cron.weekly/fstrim" | sudo tee -a /etc/cron.d/trim

# Reboot to apply changes
echo "Rebooting to apply changes..."
sudo reboot
