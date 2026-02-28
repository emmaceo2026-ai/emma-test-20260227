# AI Agent Starter Guide: Build Your Own Autonomous CEO Agent (OpenClaw/Felix-Style)
## From Zero to Profitable in Weeks – Low-Cost Setup for Windows Users

---

## Table of Contents
1. [Introduction](#introduction)
2. [Why OpenClaw + Emma Setup](#why-openclaw--emma-setup)
3. [Setup Steps – Detailed & Windows-Focused](#setup-steps--detailed--windows-focused)
   - [Step 1: Prerequisites](#step-1-prerequisites)
   - [Step 2: Install OpenClaw](#step-2-install-openclaw)
   - [Step 3: Bootstrap Emma](#step-3-bootstrap-emma)
   - [Step 4: Memory + Cron Setup](#step-4-memory--cron-setup)
   - [Step 5: Skills Creation](#step-5-skills-creation)
   - [Step 6: ReliablePDFExporter Skill](#step-6-reliablepdftool-skill)
   - [Troubleshooting](#troubleshooting)
   - [Advanced Troubleshooting](#advanced-troubleshooting)
4. [First Product Launch Example](#first-product-launch-example)
5. [Profit & Scaling Tips](#profit--scaling-tips)
6. [Conclusion & Next Steps](#conclusion--next-steps)
7. [Bonus: Ready-to-Copy Prompts](#bonus-ready-to-copy-prompts)

---

## Advanced Troubleshooting
1. **Token Stalls**: If you notice any token stalling during operations, consider breaking down larger tasks into smaller chunks. This not only helps in managing token consumption but also reduces the chances of hitting limits.

2. **Path Optimizations**: Always ensure you're working within your Ubuntu home directory (`~/.openclaw`). Running scripts or commands from `/mnt/c` can significantly slow down performance due to file system translations. Keep everything in Ubuntu for optimal speed.

3. **Common Installation Issues**: If you encounter errors during the OpenClaw installation, recheck your Node.js version with:
   ```bash
   node -v
   ```
   Make sure you’re using version 22 or higher, as older versions may not support some dependencies.

4. **WSL Restart Issues**: After making changes to `wsl.conf`, be sure you fully restart WSL. Running the command:
   ```bash
   wsl --shutdown
   ```
   from PowerShell is essential to applying configuration changes.

5. **Resource Limits**: Monitor system resource usage while executing tasks. Insufficient memory or CPU allocation may lead to unexpected behavior or crashes.