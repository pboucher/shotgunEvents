FROM centos:7
MAINTAINER Patrick Boucher <pboucher@patrickboucher.com>

# Upgrade the OS
RUN yum upgrade -y && yum install -y git && yum clean all

# Go get the Shotgun API
RUN git clone https://github.com/shotgunsoftware/python-api.git ~/repositories/python-api && cd ~/repositories/python-api && git checkout v3.0.33

# Copy over the necessary files into the container
RUN mkdir -p /root/shotgunEventDaemon
COPY docker-entrypoint.sh /root/shotgunEventDaemon/docker-entrypoint.sh
COPY src/daemonizer.py /root/shotgunEventDaemon/daemonizer.py
COPY src/shotgunEventDaemon.py /root/shotgunEventDaemon/shotgunEventDaemon.py
COPY src/shotgunEventDaemon.conf /etc/shotgunEventDaemon.conf

# Start the daemon
ENTRYPOINT ["/root/shotgunEventDaemon/docker-entrypoint.sh"]
