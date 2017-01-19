# Base Image / OS
FROM ubuntu:16.04
MAINTAINER perkris <chris.krisdan@gmail.com>

# Meta-Data
LABEL version="1.0.0" type="Ubuntu 16.04"

RUN apt-get update && apt-get install -y build-essential curl supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install Nodejs and npm package Manager
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && \
    apt-get install -y nodejs
    
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start Supervisor to manage processes
CMD ["/usr/bin/supervisord"]