# Plausible Analytics setup

This plausible is based on https://github.com/plausible/hosting.

## `plausible-conf.env`

Use `openssl rand -base64 64` to generate the `SECRET_KEY_BASE` key.

## `geoip.conf`

Register in https://www.maxmind.com/en/geolite2/signup and get the
account and license to be able to use GeoLite2 database.
