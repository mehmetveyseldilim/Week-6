FROM postgres:15.5

ENV POSTGRES_USER="dvdrental"
ENV POSTGRES_PASSWORD="dvdrental"
ENV POSTGRES_DB="dvdrental"

# We need first download archive with DVD Rental backup and then extract it
ENV ARCHIVE_NAME="dvdrental.zip"
ENV BACKUP_NAME="dvdrental.tar"
ENV URL="https://www.postgresqltutorial.com/wp-content/uploads/2019/05/${ARCHIVE_NAME}"


RUN apt-get update && apt-get install -y wget unzip

RUN wget -nv "${URL}" -O "/tmp/${ARCHIVE_NAME}" \
  && unzip -q "/tmp/${ARCHIVE_NAME}" -d /tmp

COPY restoredb.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/restoredb.sh