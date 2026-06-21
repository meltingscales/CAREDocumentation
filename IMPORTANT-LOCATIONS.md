# Important Locations

## Websites

### Internet

- <https://test1.drakonix.systems>
- <https://test2.drakonix.systems>
- <https://test3.drakonix.systems>
- <https://test4.drakonix.systems>


- <https://carerabiesstats.drakonix.systems/>
- <https://carecatstatus.drakonix.systems/>
- <https://meowderall.drakonix.systems/>
- <https://carethermometer.drakonix.systems/>
- <https://donationaggregator.drakonix.systems/>

### Local

These should be accessed if physically using the CARE server laptop.

These local connections are routed [here](https://github.com/meltingscales/drakonix.systems/blob/master/nginx/drakonix.systems.conf#L54) <https://github.com/meltingscales/drakonix.systems/blob/master/nginx/drakonix.systems.conf#L54> as well, under `proxy_pass`.

- [http://localhost:3003 - CAREShelterDonationDataAggregation](http://localhost:3003)
- [http://localhost:3002 - animal-shelter-donation-thermometer](http://localhost:3002)
- [http://localhost:3001 - Meowderall](http://localhost:3001)
- [http://localhost:3005 - CARERabiesStats](http://localhost:3005)
- [http://localhost:3007 - CARECatStatus](http://localhost:3007)

## Git Repositories (on disk)

Please note that `~` means "user's home directory".

By default this is `/home/careops/`.

All these repositories live under `/home/careops/Git/*`.

- ~/Git/CARERabiesStats
- ~/Git/CARECatStatus
- ~/Git/Meowderall
- ~/Git/CAREShelterDonationDataAggregation
- ~/Git/animal-shelter-donation-thermometer

## Initial Setup

Clone all CARE repositories onto the server:

```bash
cd ~/Git

git clone git@github.com:meltingscales/CARERabiesStats.git
git clone git@github.com:meltingscales/CARECatStatus.git
git clone git@github.com:meltingscales/meowderall.git
git clone git@github.com:meltingscales/CAREShelterDonationDataAggregation.git
git clone git@github.com:meltingscales/animal-shelter-donation-thermometer.git
```

## Git Repositories (on internet)

- <https://github.com/meltingscales/CARERabiesStats>
- <https://github.com/meltingscales/CARECatStatus>
- <https://github.com/meltingscales/meowderall>
- <https://github.com/meltingscales/animal-shelter-donation-thermometer>
- <https://github.com/meltingscales/CAREShelterDonationDataAggregation>
