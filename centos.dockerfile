FROM centos/systemd

RUN yum install openssh-server htop ncdu nload -y
RUN mkdir -p /root/.ssh
