FROM debian:11

# Imposta le variabili di ambiente per evitare interattività durante l'installazione
ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna il sistema e installa Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

COPY nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html

# Espone la porta "" per l'accesso HTTP
EXPOSE 80

# Comando per avviare Nginx in primo piano
CMD ["nginx", "-g", "daemon off;"]

