# Docker-Webmin
dockerfile for webmin （Webmin 的 Docker 镜像编译文件）

Download Webmin file（Webmin 官方包下载地址）:<br>
　　[https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb](https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb)<br>
Web Page Url（Webmin 官方包下载页面）:<br>
　　[https://www.webmin.com/download.html](https://www.webmin.com/download.html)<br>

## Building the image （编译镜像）
```
git clone https://github.com/FriBox/Docker-Webmin.git
cd Docker-Webmin
docker build -t fribox/webmin .
```

## Export the image （导出镜像保存）
```
docker save fribox/webmin -o FriBox.Docker-Webmin.tar
```

## Running the container (启动容器)
```
docker run --name webmin -d --restart=always --publish 10000:10000/tcp fribox/webmin
```

## Log into webmin and manage your server （登录页面Webmin管理页面）
```
https://hostname.or.ip:10000
(root:pass) 用户名和密码
```
