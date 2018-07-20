docker run -d --privileged --memory 300000000 \
  --network etest --name test-dev \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /root/.ssh/authorized_keys:/root/.ssh/authorized_keys \
  -v /var/lib/lxcfs/cgroup/:/cgroup/:rw \
  -v /var/lib/lxcfs/proc/cpuinfo:/proc/cpuinfo:rw \
  -v /var/lib/lxcfs/proc/diskstats:/proc/diskstats:rw \
  -v /var/lib/lxcfs/proc/meminfo:/proc/meminfo:rw \
  -v /var/lib/lxcfs/proc/stat:/proc/stat:rw \
  -v /var/lib/lxcfs/proc/swaps:/proc/swaps:rw \
  -v /var/lib/lxcfs/proc/uptime:/proc/uptime:rw \
  harbor.shopeemobile.com/cloud/dev:centos init
