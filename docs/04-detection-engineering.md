### `docs/04-detection-engineering.md`

```markdown
# 04 - Detection Engineering & Response Automation

## 1. Behavioral Detection Strategy
Because modern C2 payloads (like Sliver or Cobalt Strike) are easily obfuscated to generate zero static hash detections, detection engineering must rely on behavioral telemetry:
- Suspicious parent-child process relationships (e.g., binaries spawning from user temp directories).
- Non-browser processes initiating periodic outbound HTTP/HTTPS connections.
- Unsigned binaries establishing network connections.

## 2. Sample LimaCharlie Detection & Response (D&R) Rule

This rule monitors for processes executing out of user `Downloads` folders that establish external network connections:

```yaml
# Detection Logic
event: NETWORK_CONNECTIONS
op: ends with
path: event/FILE_PATH
value: \Downloads\EVERYDAY_BOWTIE.exe

# Response Action
---
- action: report
  name: Suspicious C2 Beacon Detected in User Downloads
- action: add tag
  tag: c2_compromised
  ttl: 3600
