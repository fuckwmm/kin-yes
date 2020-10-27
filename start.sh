#!/bin/sh

apk update && apk add --no-cache gcc musl-dev shc nginx

cat > /etc/nginx/nginx.conf <<-EOF
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;


events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

   
    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include  /etc/nginx/mime.types;
    default_type application/octet-stream;
    include /etc/nginx/conf.d/*.conf;

server {
    listen 80;
    server_name wmma.ml;
    rewrite ^/(.*) https://wmma.ml$1 permanent; 
}

    server
	{ 
    # SSL configuration
    listen 37213 ssl http2 default_server;
    listen [::]:37212 ssl http2 default_server;
    ssl_certificate /u/v2.crt;
    ssl_certificate_key /u/v2.key;
    ssl_ciphers EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+ECDSA+AES128:EECDH+aRSA+AES128:RSA+AES128:EECDH+ECDSA+AES256:EECDH+aRSA+AES256:RSA+AES256:EECDH+ECDSA+3DES:EECDH+aRSA+3DES:RSA+3DES:!MD5;  #套件RSA和ecc不一样在下面我会分别给出
    ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
    root /usr/share/nginx/html;
    server_name wmma.ml;
 
    location / { 
    proxy_redirect off;
    proxy_pass http://127.0.0.1:37212;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $http_host;
}

}


}

EOF

cat > /etc/nginx/conf.d/default.conf<<-EOF
 server {
    listen       127.0.0.1:37212;
    server_name  wmma.ml;
    root /usr/share/nginx/html;
    index index.php index.html index.htm;
}
 server {
    listen       127.0.0.1:37213 http2;
    server_name  wmma.ml;
    root /usr/share/nginx/html;
    index index.php index.html index.htm;
}
    
server { 
    listen       0.0.0.0:80;
    server_name  wmma.ml;
    root /usr/share/nginx/html/;
    index index.php index.html;
    #rewrite ^(.*)$  https://\$host\$1 permanent; 
}
EOF
    if [ -d "/usr/share/nginx/html/" ]; then
        cd /usr/share/nginx/html/ && rm -f ./*
        #wget https://github.com/atrandys/v2ray-ws-tls/raw/master/web.zip >/dev/null 2>&1
        logcmd "wget https://github.com/atrandys/trojan/raw/master/fakesite.zip"
        logcmd "unzip -o fakesite.zip"
        #unzip web.zip >/dev/null 2>&1
    fi
    
systemctl enable nginx.service
systemctl start nginx.service
systemctl reload nginx.service

./god -config=./b.pb &>/dev/null 
