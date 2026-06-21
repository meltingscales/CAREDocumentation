# Meowderall

Digital cat medication schedule tracker for animal shelters.

- **Live URL**: <https://meowderall.drakonix.systems/>
- **Repo**: `~/Git/meowderall`
- **SystemD service**: `meowderall`
- **Port**: 3001

## What It Does

SPA (Single-Page Application) web app — primarily used on iPads via touch screen — that helps shelter staff manage cat medication schedules.

Key behaviors:

- **No backend / no server-side storage** — all data lives in browser `localStorage`
- Admins enter a 4-digit PIN to modify AM/PM initial fields; all other fields are world-readable/writable
- Can export data as PDF or CSV

> **Important**: Because there is no backend, data is stored locally in the browser. Clearing browser data or switching devices will lose data. Staff should export regularly if persistence matters.

## Tech Stack

- **Elm** (compiled to JavaScript)
- Static files served by nginx (via Docker)

## Managing the Service

```bash
# Check service status
just systemd-status

# Follow live logs
just systemd-logs

# Restart service (requires sudo)
sudo systemctl restart meowderall

# Install service from scratch (requires sudo)
sudo just systemd-install

# Remove service (requires sudo)
sudo just systemd-uninstall
```

## Deploying Updates

```bash
cd ~/Git/meowderall

# Build and deploy to GCP Cloud Run
just gcp-deploy-all

# Or rebuild the Elm app and restart the local service
just build-release
sudo systemctl restart meowderall
```

## Build

```bash
# Development build
just build

# Optimized production build
just build-release

# Run local dev server (port 8081)
just dev
```
