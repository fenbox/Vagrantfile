Vagrantfile
===========

这是一个 LEMP/LNMP 的 Vagrant 开发环境，可以运行 Typecho、WordPress 等程序。环境配置根据 [Linode](https://www.linode.com/docs/web-servers/lemp/how-to-install-a-lemp-server-on-ubuntu-18-04/) 官方教程搭建。

本配置在 `Vagrant 2.2.*`，虚拟机为 `VirtualBox 6.0.*` 下测试通过。安装步骤：

1. 安装 [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 虚拟机及 [Vagrant](https://www.vagrantup.com/downloads.html) 程序
2. 添加 box 镜像 `vagrant box add bento/ubuntu-18.04`，选择 `virtualbox`
4. 执行建立环境 `vagrant up`


文件说明：

* `Vagrantfile`：Vagrant 的配置文件
* `bootstrap.sh`：镜像初始化时自动运行的脚本
* `sources.list`：源镜像服务器
* `nginx/*`：Typecho、WordPress 的 nginx 的参考配置文件


## 链接数据库报错 Access denied

> Access denied for user 'root'@'localhost' (using password: YES)

```
$ sudo mysql -u root -p
```

在数据库里执行：

```
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root' AND plugin = 'unix_socket';
FLUSH PRIVILEGES;
\q
```

重启 MariaDB 服务：

```
$ sudo service mysql restart
```

方法来源 <https://stackoverflow.com/a/35748657/620935>


## 静态文件缓存无法实时刷新

这是 VirtualBox 的一个 BUG，需要修改 nginx.conf 文件：

```
$ sudo vi /etc/nginx/nginx.conf
```

把里面的 `sendfile off;` 改为 `sendfile on;`

方法来源 <https://www.vagrantup.com/docs/synced-folders/virtualbox.html>
