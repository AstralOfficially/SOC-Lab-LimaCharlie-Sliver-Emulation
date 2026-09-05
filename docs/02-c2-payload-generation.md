### `docs/02-c2-payload-generation.md`

```markdown
# 02 - Adversary Infrastructure & Payload Generation

## 1. Sliver C2 Service Management
On the Ubuntu Linux attacker machine (`10.1.115.232`):

1. Check or start the background Sliver service:
   ```bash
   sudo systemctl status sliver
   sudo systemctl start sliver
