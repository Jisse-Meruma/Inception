FROM debian:12-slim

# Install Nginx from the Debian packages (-y Will say yes to every prompt it gives use "Very safe :)")
RUN apt-get update && apt-get install -y nginx && apt install -y openssl

RUN mkdir -p /etc/ngnix/ssl

#Copy the Host configs to the container nginx folder
COPY conf/nginx.conf /etc/nginx/nginx.conf

#this is for supporting TLS
RUN mkdir -p /etc/nginx/certs && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
	-nodes -out /etc/ssl/certs/certificate.crt \
	-keyout /etc/ssl/private/certificate.key \
	-subj "/CN=jmeruma.codam.nl"

RUN ls -Rl /etc/ssl 

#Expose port 443 to connect to the internet
EXPOSE 443

# This will run the nginx with a global change that the nginx deamon is turned off (this will allow that docker can keep running nginx) 
CMD ["nginx", "-g", "daemon off;"]
