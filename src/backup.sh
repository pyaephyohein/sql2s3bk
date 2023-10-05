BACKUP_NAME="backup-$(date +%Y-%m-%d).sql.gz"


DATABASES=`mysql --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST -Nse "SELECT GROUP_CONCAT(SCHEMA_NAME SEPARATOR ' ') FROM information_schema.SCHEMATA WHERE SCHEMA_NAME NOT IN ('mysql','information_schema','performance_schema','sys');"`

echo $DATABASES
FOLDER_NAME="$(date +%Y-%m-%d)"
BACKUP_DIR="/tmp"
mkdir /$BACKUP_DIR/$FOLDER_NAME


for db in $DATABASES; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo -e "\nDumping database: $db to Folder >>  $BACKUP_DIR/$FOLDER_NAME/$db-$BACKUP_NAME"
        mysqldump --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=$MYSQL_HOST ${db} | gzip > $BACKUP_DIR/$FOLDER_NAME/$db-$BACKUP_NAME
        echo -e "Finished dump $db-$BACKUP_NAME\n"
    fi
done


echo -e "\n********** Uploading database to s3://${BUCKET_NAME}/$FOLDER_NAME/ **********\n" 


aws s3 cp --recursive $BACKUP_DIR/$FOLDER_NAME s3://${BUCKET_NAME}/$FOLDER_NAME/

echo -e "\nFinished backup................................"

