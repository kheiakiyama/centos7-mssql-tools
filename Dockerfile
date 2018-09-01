FROM centos:centos7
MAINTAINER kheiakiyama

# adding custom MS repository
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
RUN yum update -y
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

# install SQL Server drivers and tools
RUN ACCEPT_EULA=Y yum install mssql-tools unixODBC-devel -y
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

CMD /bin/bash 
