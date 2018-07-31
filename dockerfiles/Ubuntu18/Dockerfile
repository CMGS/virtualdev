FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt install -y sudo systemd openssh-server htop ncdu nload git iproute2 apt-transport-https ca-certificates curl software-properties-common git \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable" \
    && apt-get install -y docker-ce

RUN set -x \
    && groupadd -r dockremap \
    && useradd -r -g dockremap dockremap \
    && echo 'dockremap:1655536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid
# set up modprobe
RUN curl -L "https://raw.githubusercontent.com/docker-library/docker/master/modprobe.sh" -o /usr/local/bin/modprobe \
    && chmod +x /usr/local/bin/modprobe

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN find /etc/systemd/system \
         /lib/systemd/system \
         -path '*.wants/*' \
         -not -name '*journald*' \
         -not -name '*systemd-tmpfiles*' \
         -not -name '*systemd-user-sessions*' \
         -exec rm \{} \;

ENV container docker
RUN systemctl set-default multi-user.target
RUN systemctl enable docker ssh

RUN mkdir -p /root/.ssh
# Force volume /var/lib/docker here
