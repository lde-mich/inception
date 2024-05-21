FROM debian:11

# installa i pacchetti di mariadb
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 var/run/mysqld
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# avvio di MariaDB
#CMD ["tail", "-f", "/dev/null"] #comando per testare e far andare il container
								 #in loop cosi da entrarci dentro

CMD ["mysqld"]

