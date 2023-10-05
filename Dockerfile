FROM alpine:3.18.4
RUN apk update && apk add --no-cache bash aws-cli mysql-client
RUN mkdir /apps
WORKDIR /apps
COPY ./src/* /apps/src/
RUN chmod +x /apps/src/backup.sh
