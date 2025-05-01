#!/bin/bash
# PHP, Composer & Laravel

# Add ondrej's repository
if php_version_is_84_or_higher == true; then
    install_app php
else
    gum confirm "Add Ondrej repo and install 8.4?" && \
    LC_ALL=C.UTF-8 sudo add-apt-repository -y ppa:ondrej/php && \
    install_app software-properties-common php8.4 || \
    install_app php
fi


# Add Postgress
gum confirm --Title "Install Postgress? If not MySQL will be installed" && apps+=("postgresql") || apps+=("mysql-server" "php-mysql")

# Install apps
install_app "${apps[@]}"

# Test PHP
gum confirm "Test PHP?" && sudo bash -c "echo '<?php phpinfo (); ?>' >> /var/www/html/info.php" && xdg-open http://localhost/info.php

# Install composer
gum spin --title "Installing Composer" -- bash -c "
    cd ~ && \
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    HASH=\$(curl -sS https://composer.github.io/installer.sig) && \
    php -r 'if (hash_file(\"SHA384\", \"/tmp/composer-setup.php\") === \"\$HASH\") { echo \"Installer verified\"; } else { echo \"Installer corrupt\"; unlink(\"/tmp/composer-setup.php\"); } echo PHP_EOL;'
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
"


# Install Laravel globally
gum spin --Title "Installing Laravel" -- composer global require laravel/installer

export restaller_message="LAMP + Composer & Laravel installed"

read -n 1 -s -r -p "Press any key to continue"

