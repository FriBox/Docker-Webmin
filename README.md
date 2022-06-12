# docker-webmin
dockerfile for webmin

Download Webmin file: [https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb](https://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb)<br>
Web Page Url: https://www.webmin.com/download.html

## Building the image
```
git clone https://github.com/FriBox/Docker-Webmin.git
cd Docker-Webmin
docker build -t fribox/webmin .
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
