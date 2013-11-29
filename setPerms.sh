#!/bin/bash
sudo chown -R www-data:dev /var/www
sudo chmod -R 570 /var/www

sudo chown -R www-data:dev /opt/web
sudo chmod -R 570 /opt/web

# Drupal Specific Permissions
sudo chown www-data:www-data /var/www/keys
sudo chmod 700 /var/www/keys

sudo chown www-data:www-data /opt/web/keys
sudo chmod 700 /opt/web/keys

sudo chown www-data:dev /opt/web/zenfactory.org/sites/default/files
sudo chmod 770 /opt/web/zenfactory.org/sites/default/files
