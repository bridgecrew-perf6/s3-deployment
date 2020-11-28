# s3-deployment
This min.io deployment creates a systemd unit for minio and installs nginx as reverse proxy.

## Installation
To install this script you have type in
```sh
    bash install.sh
```

This will download minio create a systemd unit for it and starts nginx as reverse proxy.


### Configuration
You have to configure the access-key and secret-key in /etc/minio/minio.env e.g.
```sh
# /etc/minio/minio.env

MINIO_ACCESS_KEY=1234
MINIO_SECRET_KEY=1234
```