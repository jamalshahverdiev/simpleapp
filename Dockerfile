FROM centos:latest
MAINTAINER Sander <mail@sandervanvugt.nl>

# Add repo file
#ADD ./sander.repo /etc/yum.repos.d/

# Copy code file
COPY code.sh .
RUN ./code.sh

# Install cool software
RUN yum -y update && yum -y install nmap iproute && yum clean all

ENTRYPOINT ["/usr/bin/nmap"]
CMD ["-sn", "172.17.0.0/24"]
