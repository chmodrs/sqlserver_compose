# specify the image with sql server installed
FROM microsoft/mssql-server-linux:latest
 
# accept the EULA
ENV ACCEPT_EULA=Y
 
# install curl & sudo
RUN apt-get update && apt-get install -y curl sudo
 
# Import the public repository GPG keys
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
 
# Register the Microsoft SQL Server Ubuntu repository
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
 
# update package list 
RUN apt-get update -y
 
# install the agent
RUN apt-get install -y mssql-server-agent

# create database directory

RUN mkdir -p /var/opt/mssql/backup

