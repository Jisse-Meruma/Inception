FROM debian:12-slim

# Install Nginx from the Debian packages (-y Will say yes to every prompt it gives use "Very safe :)")
RUN apt-get update && apt-get install -y nginx && apt install -y openssl

#Copy the Host configs to the container nginx folder
COPY conf/nginx.conf /etc/nginx/nginx.conf

#this is for supporting TLS aka HTTPS SSL = secure socket layer TLS = Transport Layer Security
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
	-nodes \
	-out 	/etc/nginx/ssl/certificate.crt \
	-keyout /etc/nginx/ssl/certificate.key \
	-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/OU=Me/CN=jmeruma"

#Expose port 443 to connect to the internet
EXPOSE 443

# This will run the nginx with a global change that the nginx deamon is turned off (this will allow that docker can keep running nginx) 
CMD ["nginx", "-g", "daemon off;"]
