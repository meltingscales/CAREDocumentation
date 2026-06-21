# CARECatStatus

Real-time collaborative cat status board for shift staff at CARE Animal Shelter.

- **Live URL**: <https://carecatstatus.drakonix.systems/>
- **Repo**: `~/Git/CARECatStatus`
- **SystemD service**: `care-cat-status`
- **Port**: 3007

## What It Does

Multiple staff members can view and update cat statuses simultaneously — changes sync across all connected devices instantly via WebSocket.

Per-cat fields:

| Field        | Values                            |
|--------------|-----------------------------------|
| `name`       | Cat's name                        |
| `color`      | `green` / `yellow` / `blue`      |
| `location`   | `adoption center` / `foster`     |
| `notes`      | Free text                         |
| `food_notes` | Free text                         |

Also installable as a PWA on phones and tablets.

## Managing the Service

```bash
# Check service status
just systemd-status

# Follow live logs
just systemd-logs

# Restart service (requires sudo)
sudo systemctl restart care-cat-status

# Install service from scratch (requires sudo)
sudo just systemd-install

# Remove service (requires sudo)
sudo just systemd-uninstall
```

## User Management

Authentication is **disabled when no users exist**. Once any user is added, everyone must sign in with username + PIN.

```bash
# Add a user
just add-user firstname-lastname 1234

# Change a user's PIN
just modify-user firstname-lastname 5678

# Rename a user
just rename-user old-name new-name

# Delete a user
just delete-user firstname-lastname

# List all users
just list-users
```

Usernames must be lowercase letters and hyphens only (e.g. `jane-doe`).

## Login

Open the app in a browser. If users exist, a sign-in screen appears:

- Type your `firstname-lastname` in the username field
- Enter your PIN on the numpad (click buttons or press digit keys / Backspace / Enter)

## Deploying Updates

```bash
cd ~/Git/CARECatStatus
just build
sudo systemctl restart care-cat-status
```

## Configuration

| Environment Variable | Default   | Description          |
|----------------------|-----------|----------------------|
| `PORT`               | `3000`    | HTTP/WebSocket port  |
| `DATABASE_URL`       | `cats.db` | SQLite database path |

## API & Docs

- OpenAPI spec: `/openapi.json`
- Swagger UI: `/docs`
