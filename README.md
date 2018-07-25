Virtualdev
==========


Now, we use it to create our own EC2!

* lxcfs 是一定要的
* 运行时的时候投入 pubkey
* 持久化的数据可以引入 home 目录写入 ceph/mfs
* 允许自定义镜像，容器 commit 需要 core 实现
* calico 子网需要下发办公网络(路由表也行，反正都是开发了)
* 运行时的时候需要给一个 docker 主目录 /var/lib/docker，可以用 tmp 模拟

#### Dev

在有 lxcfs 的机器上运行 ```./dev.sh```

#### ERU 集成

```/cli container deploy --pod eru --entry ec2 --file ~/.ssh/id_rsa.pub:/root/.ssh/authorized_keys --network etest --image harbor.shopeemobile.com/cloud/virtualdev:centos --cpu 0.05 --mem 300000000 ./spec.yaml```

