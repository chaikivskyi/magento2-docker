#!/bin/bash

docker-compose exec php bash -c 'bin/magento setup:install '\
'--base-url=http://"$HOSTNAME" '\
'--db-host="$MYSQL_HOST" '\
'--db-name="$MYSQL_DATABASE" '\
'--db-user="$MYSQL_USER" '\
'--db-password="$MYSQL_PASSWORD" '\
'--admin-firstname=admin '\
'--admin-lastname=admin '\
'--admin-email=admin@admin.com '\
'--admin-user=root '\
'--admin-password=root123 '\
'--language=en_US '\
'--currency=USD '\
'--timezone=America/Chicago '\
'--use-rewrites=1 '\
'--elasticsearch-host=elasticsearch '\
'--elasticsearch-port=9200 ' \
'--search-engine=elasticsearch7'