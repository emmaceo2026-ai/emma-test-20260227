# AI Agent Starter Guide

## Introduction
In this guide, we will explore the world of AI agents, what they are, and how you can set up your own. Setting up an AI agent correctly can streamline your productivity and automate tasks.

## Setup Steps
### Step 1: Choosing Your Platform
Investigate available platforms like OpenClaw for ease of use and functionality.

### Step 2: Installation Requirements for Windows 11 Users
**Recommended Method: Install via WSL2 + Ubuntu**  
This avoids path and dependency issues associated with native Windows installations. Native Windows installs can be slower and less stable.

#### Detailed Steps:
1. **Enable WSL2:**  
   Open PowerShell as Admin and run:  
   ```bash  
   wsl --install  
   ```  
   (This installs Ubuntu by default; reboot if prompted.)

2. **Open Ubuntu Terminal:**  
   Access it from the Start menu by searching for "Ubuntu" or run:  
   ```bash  
   wsl  
   ```

3. **Update Packages:**  
   Run:  
   ```bash  
   sudo apt update && sudo apt upgrade -y  
   ```

4. **Install Node.js (v22+ required):**  
   Use the NodeSource repo for installation:
   ```bash  
   curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt install -y nodejs  
   ```

5. **Run Official One-Liner Installer (Recommended):**  
   ```bash  
   curl -fsSL https://openclaw.ai/install.sh | bash  
   ```  
   (Handles Node detection, pnpm installation, CLI install, and launches the onboarding wizard.)  
   
   Alternatively, from source:
   ```bash  
   git clone https://github.com/openclaw/openclaw.git && cd openclaw && pnpm install && pnpm ui:build && pnpm build && openclaw onboard  
   ```

6. **Enable systemd for Daemon/Gateway:**  
   Open Ubuntu and run:  
   ```bash  
   sudo nano /etc/wsl.conf  
   ```  
   Add:
   ```plaintext  
   [boot]  
   systemd=true  
   ```  
   Save and exit, then from PowerShell run:  
   ```bash  
   wsl --shutdown  
   ```  
   (Reopen Ubuntu afterward to apply changes.)

7. **Verify Installation:**  
   Check if OpenClaw is installed by running:  
   ```bash  
   openclaw --version  
   ```  
   Then run:  
   ```bash  
   openclaw onboard  
   ```  
   (Follow the prompt of the installation wizard.)

### Troubleshooting Tips:
- **Avoid /mnt/c paths:** Slows down performance; keep everything in your Ubuntu home (`~/.openclaw`).  
- **If errors occur:** Check Node version with `node -v`, restart WSL, or rerun the installer.  
- **If curl fails:** Check your internet connection and firewall settings.

---

## Conclusion
Creating your own AI agent opens doors to automating routine tasks and enhancing your capabilities. By following this guide, you’ll be well on your way to harnessing this technology.

# Launch Schedule
- **Launch Date:** TBD
- **Marketing Strategy:** Leverage social media and online communities.