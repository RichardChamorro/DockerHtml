FROM ubuntu:22.04
# Instalacion de dependencias
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y openssh-server
RUN /etc/init.d/ssh start
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh -p && \
    chmod 700 /home/remote_user/.ssh
COPY remote.key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

EXPOSE 80 443
