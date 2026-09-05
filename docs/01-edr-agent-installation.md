# Phase 1: EDR Setup and Configuration

## Purpose
Deploy the LimaCharlie EDR sensor onto the target Windows VM endpoint, establish cloud connectivity, configure Windows artifact log collection, and enable community Sigma rule detection integration.

---

## 1. LimaCharlie Organization Creation
1. Access the LimaCharlie administrative web console.
2. Create a new organization:
   - **Organization Name:** Configured for the dedicated home lab.
   - **Data Residency:** Configured to the nearest geographic region.
   - **Template:** Set to empty / no preconfigurations.
3. Once provisioned, navigate to the **Installation Keys** view under **Sensor Management**.
4. Generate an installation key:
   - **Description / Key Name:** `Windows VMNET`
   - Copy the generated enrollment key secret for command-line agent deployment.

<!-- Screenshot Placeholder -->
> **Screenshot:** `screenshots/01-limacharlie-sensor-installation-key.png`  
> **Timestamp:** `[00:03:10]`  
> **Caption:** Generating the "Windows VMNET" installation enrollment key in the LimaCharlie dashboard.

---

## 2. Sensor Deployment on Target Windows VM
The Windows sensor executable (`lc_sensor.exe`) was pre-staged in the `C:\Users\Administrator\Downloads` folder.

Run an elevated command prompt on the Windows target and execute:

```cmd
cd C:\Users\Administrator\Downloads
lc_sensor.exe -i <YOUR_INSTALLATION_KEY_HERE>
