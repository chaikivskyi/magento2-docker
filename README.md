## How to configure Varnish

````
php bin/magento config:set --scope=default --scope-code=0 system/full_page_cache/caching_application 2
php bin/magento setup:config:set --http-cache-hosts=varnish:80

````

## How to configure Redis
````
php bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1
php bin/magento setup:config:set --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=3 --session-save-redis-db=2 --session-save-redis-compression-lib=gzip
````
