FROM centos:8

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN dnf -y update
RUN yum -y install java

COPY aggregate_core_6.20.00_unix-x64.sh /home/

RUN dnf -y install java-1.8.0-openjdk-devel
RUN dnf -y install xorg-x11-server-Xvfb libXrender.x86_64 libXtst.x86_64

RUN dnf -y upgrade

RUN dnf -y install systemd openssh-server vim curl wget iproute iputils

RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd

EXPOSE 22
EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/init"]
