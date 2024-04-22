FROM debian:12-slim

# Install Nginx from the Debian packages (-y Will say yes to every prompt it gives use "Very safe :)")
RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /etc/ngnix/ssl

#Copy the Host configs to the container nginx folder
COPY conf/nginx.conf /etc/nginx/nginx.conf
#this is for supporting TLS
COPY tools/localhost.crt /etc/nginx/ssl/localhost.crt
COPY tools/localhost.key /etc/nginx/ssl/localhost.key

#Expose port 443 to connect to the internet
EXPOSE 443

# This will run the nginx with a global change that the nginx deamon is turned off (this will allow that docker can keep running nginx) 
CMD ["nginx", "-g", "daemon off;"]
