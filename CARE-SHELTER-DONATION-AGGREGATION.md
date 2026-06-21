# CAREShelterDonationDataAggregation

Web tool to aggregate donation data from multiple platforms into a single DonorSnap-ready CSV.

- **Live URL**: <https://donationaggregator.drakonix.systems/>
- **Repo**: `~/Git/CAREShelterDonationDataAggregation`
- **SystemD service**: `care-shelter-donation`
- **Port**: 3003

## What It Does

C.A.R.E. receives donations through multiple platforms. Each exports data differently, making DonorSnap imports painful. This tool accepts one consolidated Excel file and outputs a standardized CSV.

**Supported sources:**

- DonorSnap
- Qgiv
- PayPal
- Square
- ShelterLuv
- Facebook PayPal

**Privacy**: No data is stored. Files are processed in memory and immediately deleted.

## Using the Web App

1. Go to the URL above (or `http://localhost:3003` locally)
2. Upload an Excel file (`.xls` or `.xlsx`) with sheets named exactly:
   - `DonorSnap`
   - `Qgiv`
   - `ShelterLuv`
   - `Square`
   - `Facebook PayPal`
3. Download the combined CSV, ready for DonorSnap import

**Additional pages:**

- `/about` — how the tool works
- `/mappings` — field mappings from each source to output
- `/faq` — frequently asked questions

## Output Fields

The output CSV contains:

- First, Last, Company
- EMail, Phone
- Address1, Address2, Address3, City, State/Province, Zip/Postal Code, Country
- Salutation
- Donation Date, Amount, Donation Type, Payment Method
- DonationNote

## Managing the Service

```bash
# Check service status
just systemd-status

# Follow live logs
just systemd-logs

# Restart service (requires sudo)
sudo systemctl restart care-shelter-donation

# Install service from scratch (requires sudo)
sudo just systemd-install

# Remove service (requires sudo)
sudo just systemd-uninstall
```

## Deploying Updates

```bash
cd ~/Git/CAREShelterDonationDataAggregation

# GCP Cloud Run deployment (production)
just gcp-deploy-all

# Or rebuild locally
just build
sudo systemctl restart care-shelter-donation
```

## GCP Deployment

The production service runs on GCP Cloud Run. To deploy:

```bash
export GCP_PROJECT="careshelterdonationdataagg"
export GCP_REGION="us-central1"

# Build Docker image, push to GCR, deploy to Cloud Run
just gcp-deploy-all

# View live logs from Cloud Run
just gcp-logs

# Get production URL
just gcp-url
```
