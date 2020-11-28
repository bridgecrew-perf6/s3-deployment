curl -o minio https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x ./minio

mkdir -p /usr/local/bin/minio

cp ./minio /usr/local/bin/minio/minio

mkdir -p /var/minio/data

cp ./minio.service /usr/lib/systemd/system/

systemctl start minio
systemctl enable minio