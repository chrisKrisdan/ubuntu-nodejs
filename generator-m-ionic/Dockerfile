# Base Image / OS
FROM ubuntu:16.04
MAINTAINER perkris <chris.krisdan@gmail.com>

# Meta-Data
LABEL version="1.0.0" type="Generator-m-ionic"

RUN apt-get update && apt-get install -y build-essential curl python-software-properties supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#Install Oracle JDK 7
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java7-installer && oracle-java7-set-default
#RUN apt-get install -y oracle-java8-installer && oracle-java8-set-default

#Install the Android SDK
WORKDIR /opt/
RUN curl -O http://dl.google.com/android/android-sdk_r24.2-linux.tgz
RUN tar -zxvf android-sdk_r24.2-linux.tgz
RUN android-sdk-linux/tools/android update sdk --no-ui
#WORKDIR android-sdk-linux/tools/
#RUN ./android update sdk --no-ui
COPY bashrc.txt /root/.bashrc
RUN exec bash -1
RUN android update sdk --no-ui

# Install Nodejs and npm package Manager
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

#Update npm
RUN npm install -g npm
#RUN npm update minimatch
#RUN npm -v minimatch

#Install Generator-M-ionic
RUN npm install --global generator-m-ionic bower yo gulp
    
# Open port 3001 for ionic
EXPOSE 3001

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start Supervisor to manage processes
CMD ["/usr/bin/supervisord"]