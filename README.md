# docker-webmin
dockerfile for webmin

Download Webmin file:<br>
　　[https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb](https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb)<br>
Web Page Url:<br>
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

## Running the container
```
docker run -d -p 10000:10000 fribox/webmin
```

Log into webmin and manage your server
```
https://hostname.or.ip:10000
(root:pass)
```
