# CARE Donation Thermometer

Visual donation progress thermometer for CARE fundraising campaigns.

- **Live URL**: <https://carethermometer.drakonix.systems/>
- **Repo**: `~/Git/animal-shelter-donation-thermometer`
- **SystemD service**: `animal-shelter-thermometer`
- **Port**: 3002

## What It Does

Tracks team donation totals and displays them as a visual thermometer image. The thermometer PNG can be embedded directly in fundraising emails.

**Key features:**

- Embeddable thermometer image at `/thermometer.png`
- Multiple teams with individual totals and leaderboard
- Web-based Admin Portal at `/admin` for configuration
- Data persists via Google Cloud Firestore (or in-memory for local dev)

## Using the Admin Portal

Visit `/admin` and authenticate with the `THERMOMETER_EDIT_KEY`.

From the admin portal you can:

- Set organization name, campaign title, and fundraising goal
- Upload a CSV file with team donation data

### CSV Format

```csv
name,image_url,total_raised
Team Alpha,https://example.com/alpha.jpg,1250.50
Team Beta,,2340.00
```

- `name` — team name (required)
- `image_url` — team logo URL (optional)
- `total_raised` — dollars raised (required)

## Admin Key Management

The `THERMOMETER_EDIT_KEY` is a UUID required for all admin API calls.

```bash
# Generate a new key
just generate-key

# Set key in Cloud Run
just set-cloud-key <key>

# Rotate key in Cloud Run (prompts for confirmation)
just rotate-cloud-key

# Show current Cloud Run environment variables
just show-cloud-env
```

If no key is set, the server auto-generates one and prints it in the logs on startup:

```
WARN: THERMOMETER_EDIT_KEY not set, generated new key: <key>
```

## Embedding in Emails

```html
<img src="https://carethermometer.drakonix.systems/thermometer.png" alt="Donation Progress">
```

The image uses cache-busting headers so emails always show the latest totals.

## Managing the Service

```bash
# Check service status
just systemd-status

# Follow live logs
just systemd-logs

# Restart service (requires sudo)
sudo systemctl restart animal-shelter-thermometer

# Install service from scratch (requires sudo)
sudo just systemd-install

# Remove service (requires sudo)
sudo just systemd-uninstall
```

## Deploying Updates

```bash
cd ~/Git/animal-shelter-donation-thermometer

# Full GCP Cloud Run deployment
just gcp-deploy-all

# Or for local service
just build
sudo systemctl restart animal-shelter-thermometer
```

## Environment Variables

| Variable              | Required | Description                                    |
|-----------------------|----------|------------------------------------------------|
| `GCP_PROJECT`         | No       | GCP project ID — enables Firestore persistence |
| `THERMOMETER_EDIT_KEY`| No       | UUID for admin auth (auto-generated if unset)  |
| `PORT`                | No       | Server port (default: 8080)                    |
| `BASE_URL`            | No       | Base URL (default: `http://localhost:8080`)    |

Without `GCP_PROJECT`, data is stored in memory only and lost on restart.

## Firestore Management

```bash
# Setup Firestore (one-time)
just firestore-setup

# Check Firestore status
just firestore-status

# Clear all Firestore data (DANGEROUS — prompts for confirmation)
just firestore-clear
```

## API

- Swagger UI: `/openapi`
- Health check: `/health`
- Config (JSON): `/config`
