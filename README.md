# IT Support Toolkit 🛠️

This repository contains PowerShell scripts to help IT support teams automate and simplify common support tasks.

## 🔹 Categories

- `cleanup/` — Disk cleanup and temp file removal
- `networking/` — Ping tests and basic diagnostics
- `user-management/` — Add, remove, and modify local users
## 🖥 GUI Launcher

Run `launch-toolkit.ps1` to open a Windows GUI with buttons to launch key scripts:

```powershell
.\launch-toolkit.ps1


## 🏁 Usage

Run each script with administrator privileges in PowerShell:

```powershell
.\cleanup\temp-cleanup.ps1
| ping-test.ps1 | Tests internet, DNS, and gateway connectivity |
| add-local-user.ps1 | Adds a new local user account and optionally to Administrators group |


