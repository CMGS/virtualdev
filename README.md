Virtualdev
==========


Now, we use it to create our own EC2!

* lxcfs 是一定要的
* 运行时的时候投入 pubkey
* 持久化的数据可以引入 home 目录写入 ceph/mfs
* 允许自定义镜像，容器 commit 需要 core 实现
* calico 子网需要下发办公网络(路由表也行，反正都是开发了)
