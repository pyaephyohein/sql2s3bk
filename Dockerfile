FROM alpine:3.18.4
RUN apk update && apk add --no-cache bash aws-cli mysql-client
ENV MYSQL_PORT=3306 
RUN mkdir /apps
WORKDIR /apps
COPY ./src/* /apps/src/
RUN chmod +x /apps/src/backup.sh
