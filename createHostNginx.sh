#! /bin/bash

echo "127.0.0.1 $1" >> /etc/hosts

mkdir /Library/WebServer/Documents/$1

chown -R $2:wheel /Library/WebServer/Documents/$1

touch /usr/local/etc/nginx/sites-available/$1

echo "server {
        server_name $1;

        root /Library/WebServer/Documents/$1;
        index index.html index.php;

        # set expiration of assets to MAX for caching
        location ~* \.(ico|css|js|gif|jpe?g|png)(\?[0-9]+)?$ {
                expires max;
                log_not_found off;
        }

        location / {
                # Check if a file or directory index file exists, else route it to index.php.
                try_files \$uri \$uri/ /index.php;
        }

        location ~* \.php$ {
                fastcgi_pass 127.0.0.1:9000;
                include fastcgi.conf;
        }
}" >> /usr/local/etc/nginx/sites-available/$1

ln -s /usr/local/etc/nginx/sites-available/$1 /usr/local/etc/nginx/sites-enabled/$1

nginx -s stop

nginx

'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' /Library/WebServer/Documents/$1
