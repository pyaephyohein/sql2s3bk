Backup mysql Databases to s3 bucket

Environments

```bash
MYSQL_USER=
MYSQL_PASSWORD=
MYSQL_HOST=
MYSQL_PORT=
MYSQL_DATABASES=
S3_BUCKET=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
```


```bash
docker run --rm --name mysql2s3 -e AWS_ACCESS_KEY_ID= -e AWS_SECRET_ACCESS_KEY= -e AWS_DEFAULT_REGION= -e BUCKET_NAME= -e MYSQL_USER= -e MYSQL_PASSWORD= -e MYSQL_ROOT_PASSWORD= -e MYSQL_HOST=  -e MYSQL_PORT= pyaephyohein/mysql2s3bk:alpha sh /apps/src/backup.sh
```
