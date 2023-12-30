# Ultimate Chromebook Optimization Script

Welcome to the Ultimate Chromebook Optimization Script! This script is designed to enhance the performance and customization of your Chromebook. Please read this document carefully to understand the optimizations applied and how to use the script.

## Features

1. **Developer Mode Check**: Ensures that your Chromebook is in developer mode, enabling advanced features.

2. **Experimental GPU and CPU Features**: Enables experimental GPU and CPU features for potential performance improvements.

3. **CPU Performance Optimization**: Utilizes the `cpupower` utility to set the CPU governor to performance mode.

4. **Memory Usage Optimization**: Adjusts the system swappiness to optimize memory usage.

5. **Swap File Creation**: Creates a swap file for virtual memory to improve system responsiveness.

6. **Battery Settings Tweaks**: Adjusts battery settings to potentially enhance battery life.

7. **SSD Optimization**: Fine-tunes SSD parameters for better performance and lifespan.

8. **Service Disabling**: Disables unnecessary services to free up system resources.

9. **Disk Space Reclamation**: Removes unnecessary packages to reclaim disk space.

10. **Chrome Extensions Management**: Provides a placeholder to disable unused Chrome extensions.

11. **Zram Activation**: Enables Zram for compressed swap space to improve memory management.

12. **Tweak Chrome Flags**: Adds custom Chrome flags to further customize the browser's behavior.

13. **SSD TRIM Scheduling**: Schedules TRIM for SSDs to maintain SSD performance.

## How to Use

1. Ensure that your Chromebook is in developer mode before running the script.

2. Download the script to your Chromebook.

   ```bash
   wget https://link.to/script.sh

   Make the script executable.

bash

chmod +x script.sh

Run the script with root privileges.

bash

    sudo ./script.sh

    Follow on-screen instructions and reboot your Chromebook after the script execution.

Chrome Flags

In the script, you'll find a section for Chrome flags represented by --flag1 --flag2. Replace these placeholders with the desired Chrome flags. Chrome flags are experimental features that can be enabled or disabled in the browser settings. Each flag has a specific impact on browser behavior; you can find more information on available flags at chrome://flags/.
Caution

    Backup: Before running the script, it's recommended to back up important data and system settings.

    Test Environment: Consider testing the script in a controlled environment to ensure compatibility with your Chromebook model.

    Review Changes: After running the script, review the changes made to understand their impact.

    Customization: Adjust the script based on your preferences and needs.

    Community Support: Engage with the Chrome OS and Linux communities for additional support and advice.

Feel free to customize the script and README according to your specific requirements.
