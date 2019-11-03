---
title: 'Install "SNMP Server" on Windows 10 and Ubuntu 18.04'
type: posts
date: 2019-11-03T17:00:00+09:00
categories: 
  - snmp
  - os
tags:
  - windows 10
  - ubuntu 18.04
  - snmp
  - monitoring
  - udp
  - powershell
---

### 1. Windows 10 Pro

Run powershell as Administrator

```powershell
Add-WindowsCapability -Online -Name “SNMP.Client~~~~0.0.1.0”
Get-WindowsCapability -Online -Name “SNMP*”
```

Set Windows SNMP Trap Events

```powershell
evntwin
```

#### Powershell commands to monitor windows. (Use "| ConvertTo-Json")

CPU

```powershell
Get-WmiObject Win32_Processor
```

Memory

```powershell
Get-WmiObject win32_physicalmemory
Get-WmiObject win32_physicalmemory | Format-Table Manufacturer,Banklabel,Configuredclockspeed,Devicelocator,Capacity,Serialnumber -autosize
```

Disk

```powershell
wmic diskdrive get
```

### 2. Ubuntu 18.04

Creating docker container

    docker run -p 161:161/udp -v f:/gohome:/gohome -it --name snmp ubuntu bash

Update repository

    sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
    apt update && apt install -y vim net-tools inetutils-ping telnet curl git

Install packages snmpd

    apt install -y snmpd snmp
    ---
    vi /etc/snmp/snmpd.conf
    agentAddress udp:161


