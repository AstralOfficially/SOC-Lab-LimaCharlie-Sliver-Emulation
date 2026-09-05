# 01 - EDR Agent Installation & Telemetry Ingestion

## 1. LimaCharlie Cloud Organization Setup
1. Log in to [LimaCharlie](https://app.limacharlie.io/).
2. Create a new organization:
   - **Name:** `Astral Solutions`
   - **Data Residency Region:** `Canada` (or target lab region)
   - **Template:** `No template`
3. Once provisioned, navigate to **Sensors > Installation Keys**:
   - Click **Add Key** / **Create and use new**.
   - **Description:** `Windows VM - Lab`
   - Select the newly generated key.

## 2. Sensor Deployment on Windows Host
1. Select the **x86-64 (.exe)** Windows sensor installer.
2. Transfer or download `lc_sensor.exe` onto the target Windows host (e.g., in `C:\Users\Administrator\Downloads\`).
3. Launch **Command Prompt** as Administrator and run:
   ```cmd
   cd C:\Users\Administrator\Downloads
   lc_sensor.exe -i <YOUR_INSTALLATION_KEY>
