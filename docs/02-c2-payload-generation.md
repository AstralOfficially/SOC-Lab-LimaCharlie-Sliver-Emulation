Sysmon & Sigma Pipeline Ingestion

## 1. Artifact Collection Rule:

To ingest low-level Windows operational security events:

1.  Navigate to Artifact Collection in the LimaCharlie left navigation bar.
     
<!-- Screenshot Placeholder -->
> **Screenshot:** <img src="../screenshots/04-artifact-collection.png">
> **Timestamp:** <a href="https://www.youtube.com/watch?v=du6_Dk7-a-k&t=5m42s"> <img src="https://img.shields.io/badge/-Youtube-CD201F?&style=for-the-badge&logo=youtube&logoColor=white" /></a>

> **Caption:** Adding Artifact rule.

## 4. Sigma Detection Extension

1.  In the upper-right corner of the LimaCharlie console, open Add-ons.
2.  Select Extensions and search for `ext-sigma`
3.  Locate the ext-sigma extension (managed open-source Sigma rule pack for telemetry pattern matching).
4.  Click Subscribe (Free tier) to activate the rule engine.

<!-- Screenshot Placeholder -->
> **Screenshot:** <img src="../screenshots/03-sigma-ruleset-extension.png">
> **Timestamp:** <a href="https://www.youtube.com/watch?v=du6_Dk7-a-k&t=6m45s"> <img src="https://img.shields.io/badge/-Youtube-CD201F?&style=for-the-badge&logo=youtube&logoColor=white" /></a>

> **Caption:** Subscribing to the free ext-sigma detection extension.
   
## 2. Command Reference

| Command | Purpose | Notes |
| --------------- | --------------- |--------------- |
| cd C:\Users\Administrator\Downloads | Navigates to payload/executable staging folder | Run from elevated CMD |
| lc_sensor.exe -i <KEY> | nstalls LimaCharlie sensor as a background service | Requires valid org installation key |
