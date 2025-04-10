#!/bin/bash
# PHP, Composer & Laravel

# Add ondrej's repository
sudo apt install software-properties-common
LC_ALL=C.UTF-8 sudo add-apt-repository -y ppa:ondrej/php
sudo apt install -y php8.4

# Install apache2
sudo apt install -y apache2 libapache2-mod-php8.4

# Test PHP
sudo bash -c "echo '<?php phpinfo (); ?>' >> /var/www/html/info.php"
xdg-open http://localhost/info.php

# Install composer
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`

php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Install composer globally
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Install Laravel globally
composer global require laravel/installer

