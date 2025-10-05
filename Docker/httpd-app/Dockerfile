# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install Apache HTTP Server
RUN apt update && \
    apt install -y apache2 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for HTTP
EXPOSE 80

# Copy your website files (optional)
# COPY index.html /var/www/html/

# Start Apache in the foreground (so container stays alive)
CMD ["apachectl", "-D", "FOREGROUND"]

