FROM java:7-jre
MAINTAINER Raymond Kroon <raymond@k3n.nl>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
               bash \
               ca-certificates \
               libcanberra-gtk-module \
               cpio \
               libgtk2.0 \
               libxext-dev \
               libxrender-dev \
               libxtst-dev \
               wget \
               xbase-clients \
               x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

RUN echo "fs.inotify.max_user_watches=1000000" >> /etc/sysctl.conf

ENV CRASHPLAN_VERSION=4.7.0

RUN wget -nv https://download.code42.com/installs/linux/install/CrashPlan/CrashPlan_${CRASHPLAN_VERSION}_Linux.tgz -O - | tar -xz -C /tmp \
    && cd /tmp/crashplan-install \
    && sed -i 's/^more /: /g' install.sh \
    && sed -i 's:JAVACOMMON="DOWNLOAD":JAVACOMMON="/usr/bin/java":' install.sh \
    && (echo; echo; echo yes; echo ; echo y; echo; echo /backups; echo y; echo; echo; echo y; echo) | ./install.sh

ADD /files /crash
RUN chmod -R +x /crash

VOLUME [ "/var/crashplan", "/storage" ]

EXPOSE 4243 4242

ENTRYPOINT ["/crash/entrypoint.sh"]
