FROM centos:8

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN dnf -y update
RUN yum -y install java
RUN yum -y install expect

RUN dnf -y install java-1.8.0-openjdk-devel
RUN yum install -y xorg-x11-server-Xvfb
RUN yum install -y libXrender.x86_64
RUN yum install -y libXtst.x86_64
RUN yum install -y which

COPY aggregate_core_6.20.00_unix-x64.sh /home/aggregate_core_6.20.00_unix-x64.sh
COPY install.sh /home/install.sh
# RUN echo -e "\n" | bash /home/aggregate_core_6.20.00_unix-x64.sh

# RUN chmod +x /home/install.sh
# RUN /home/install.sh
# RUN chmod +x /home/aggregate_core_6.20.00_unix-x64.sh
# RUN expect -c 'spawn bash /home/aggregate_core_6.20.00_unix-x64.sh; expect "Please select a language" { send "2\n" }; expect "OK [o, Enter], Cancel [c]" {send "2\r"; exp_continue }'

RUN dnf -y upgrade

RUN dnf -y install systemd openssh-server vim curl wget iproute iputils

RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd

CMD xvfb-run --auto-servernum ./ag_server -r
