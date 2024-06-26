
# 📦 Changer Scripts

## The script provides developers with a seamless solution for managing their local IP public and hostname during development.

## 🌟 Highlights

- Set your IP Hostname in the Windows hosts file.
- Set the current IP public address on the unique Hostname always after the network connection is changed

## ℹ️ Overview

Developers often face the challenge of managing their public IP addresses while developing applications. 
When a network connection changes, they must update the IP address within their application, which can be a tedious and error-prone process.
To streamline this, developers typically set a hostname to work with, but even then, they need to manually update the IP address every time it changes.
This script solves the problem by automating the creation and management of a hostname, ensuring that developers can consistently use a stable hostname throughout the development process, regardless of IP address changes.


## ⬇️ Let's see How it Works

- Clone the Project
- Move it to a Directory that you want to
- Run the `add_current_local_ip_scheduler.ps1` as Administrator - It will create a Task-Scheduler that runs our script as soon as the network reconnects
- Disconnect your Network and Connect again - Two PowerShell windows will briefly open and close.
- Done. Your public IP address hostname is created in the Windows hosts file and you can use it as a `local_ip` name in your development connections

## Note: Please don't change the Folder structure of the scripts! It will Blow, LOL

## 🆑 Commands

Go to the Project directory, Run the Windows Powershell as Administrator, and Just follow the below command

```bash
cd /schedule
.\add_current_local_ip_scheduler.ps1
```

## 💭 Feedback and Contributing

We welcome contributions to improve this project! If you would like to contribute, please fork the repository and submit a pull request with your changes.

if you encounter any issues or have suggestions for new features, please create an issue on the GitHub repository. When submitting an issue, provide as much detail as possible, including steps to reproduce the problem, your development environment, and any relevant logs or screenshots. Your feedback and contributions are essential to making this project better for everyone.

##
