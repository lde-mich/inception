FROM debian:11

# installa i pacchetti di mariadb
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ./tools/init.sql /docker-entrypoint-initdb.d/init.sql

COPY ./tools/init_db.sh /usr/local/bin/init_db.sh
RUN chmod +x /usr/local/bin/init_db.sh
# Esegue lo script
RUN /usr/local/bin/init_db.sh

CMD ["mysqld"]




# avvio di MariaDB
#CMD ["tail", "-f", "/dev/null"] 
								#comando per far andare il container
							    #in loop, cosi da poterci entrare

