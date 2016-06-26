Vagrantfile
===========

本配置文件采用官方的 box 镜像 `ubuntu/trusty64`，使用前先运行 `vagrant box add ubuntu/trusty64` 进行添加。

文件说明：

* `Vagrantfile`：Vagrant 的配置文件
* `bootstrap.sh`：镜像初始化后自动运行的脚本
* `sources.list.mirror`：源镜像服务器

环境版本：`Vagrant 1.8.*`, `VirtualBox 5.0.*`
