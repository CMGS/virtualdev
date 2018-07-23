FROM centos/systemd

RUN yum install -y epel-release \
    && yum install -y openssh-server htop ncdu nload which git iproute \
    && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
    && yum install -y docker-ce
# set up subuid/subgid so that "--userns-remap=default" works out-of-the-box
RUN set -x \
    && groupadd -r dockremap \
    && adduser -r -g dockremap dockremap \
    && echo 'dockremap:1655536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid
# set up modprobe
RUN curl -L "https://raw.githubusercontent.com/docker-library/docker/master/modprobe.sh" -o /usr/local/bin/modprobe \
    && chmod +x /usr/local/bin/modprobe
# start docker
ENV container docker
RUN systemctl enable docker

RUN mkdir -p /root/.ssh
# Force volume /var/lib/docker here
