# CARERabiesStats

Tools for formatting and submitting rabies vaccination data to Cook County's Animal Control & Rabies (ARC) program.

- **Live URL**: <https://carerabiesstats.drakonix.systems/>
- **Repo**: `~/Git/CARERabiesStats`
- **SystemD service**: `care-rabies-stats`
- **Port**: 3005
- **Contacts**: Karin, Martha
- **Cook County ARC phone**: 708-974-6140
- **Cook County ARC email**: samantha.may@cookcountyil.gov (test submissions)

## What It Does

C.A.R.E. is enrolled in Cook County's Automatic Certificate Entry (ACE) program, which eliminates paper certificate submissions.

This tool pulls rabies vaccination records from ShelterLuv and formats them into Cook County's required tab-separated format (22 columns).

## Environment Variables

Copy `.env.example` to `.env` and fill in values:

```
SHELTERLUV_API_KEY=replaceme1234
CARE_RABIES_STATS_AUTH_KEY=replace-with-a-uuid-here
```

- `SHELTERLUV_API_KEY` — get from ShelterLuv configuration
- `CARE_RABIES_STATS_AUTH_KEY` — UUID used to authenticate report downloads via web interface

## Managing the Service

```bash
# Check service status
just systemd-status

# Follow live logs
just systemd-logs

# Restart service (requires sudo)
sudo just systemd-restart

# Install service from scratch (requires sudo)
sudo just systemd-install

# Remove service (requires sudo)
sudo just systemd-uninstall
```

## Running Reports

### API Mode (Recommended)

Pulls data directly from ShelterLuv. Requires `SHELTERLUV_API_KEY` in environment or `.env` file.

```bash
# Test run (50 records, logs to file)
just api-test

# Fetch all vaccinations, save to output.txt with log
just api-log output.txt run.log

# Fetch only 2025 vaccinations
just api-2025 output.txt run.log

# Fetch since a specific Unix timestamp
just api-since 1735711200 output.txt
```

### CSV Mode

If you have a CSV export from ShelterLuv:

```bash
just csv input.csv output.txt
```

## Owner Data Notes

The tool finds owner information in this priority order:

1. **Adopted animals** → uses adopter information
2. **Foster animals** → uses foster parent information
3. **Shelter animals** → owner fields left blank

Many animals vaccinated at C.A.R.E. are still in shelter custody, so many records will have **empty owner fields**. The tool prints a breakdown after processing.

> Verify with Cook County whether records with blank owner fields are acceptable for submission.

## Data Files

Breed/color code mapping files (`data/breed list.xlsx`, `data/color list.xlsx`) are stored in `./data/` and are not in git (gitignored). These files must be present on the server.

## Build

```bash
just build          # build everything
just build-cli      # CLI tool only
just build-web      # web server only
```
