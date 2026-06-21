# Reading SystemD Logs for CARE Services

Each CARE service runs as a SystemD unit on the server.

All repositories live under `/home/careops/Git/` on the CARE server laptop.

## Services

| Service Name           | Repository Directory                          |
|------------------------|-----------------------------------------------|
| `carerabiesstats`      | `~/Git/CARERabiesStats`                       |
| `carecatstatus`        | `~/Git/CARECatStatus`                         |
| `meowderall`           | `~/Git/Meowderall`                            |
| `donationaggregator`   | `~/Git/CAREShelterDonationDataAggregation`    |
| `carethermometer`      | `~/Git/animal-shelter-donation-thermometer`   |

## Checking Service Status

```bash
systemctl status SERVICE
```

Example:

```bash
systemctl status carerabiesstats
```

This shows whether the service is running, its last few log lines, and its PID.

## Reading Logs

### Basic log read

```bash
journalctl -xu SERVICE
```

The flags:
- `-x` — add explanatory help text to log entries
- `-u SERVICE` — filter to one specific unit/service

Example:

```bash
journalctl -xu carerabiesstats
```

### Follow logs in real time

```bash
journalctl -xu SERVICE -f
```

Useful when actively debugging — new log lines print as they arrive.

### Show logs since last boot

```bash
journalctl -xu SERVICE -b
```

### Filter by time

```bash
# Logs from the last hour
journalctl -xu SERVICE --since "1 hour ago"

# Logs between two times
journalctl -xu SERVICE --since "2024-01-01 08:00" --until "2024-01-01 09:00"
```

### Show only errors

```bash
journalctl -xu SERVICE -p err
```

Priority levels (from most to least severe): `emerg`, `alert`, `crit`, `err`, `warning`, `notice`, `info`, `debug`.

### Show N most recent lines

```bash
journalctl -xu SERVICE -n 100
```

## Justfiles

Each CARE service repository usually has a `justfile` with common maintenance commands.

```bash
# List available commands
just --list

# Or browse the file directly
less justfile
```

Common things Justfiles may include:

- Restarting the service
- Resetting passwords
- Running database migrations or maintenance
- Pulling the latest code and redeploying

## Restarting a Service

If a service is broken or needs a restart after a code change:

```bash
sudo systemctl restart SERVICE
```

To stop or start:

```bash
sudo systemctl stop SERVICE
sudo systemctl start SERVICE
```
