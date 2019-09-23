## How to configure Varnish

````
php bin/magento config:set --scope=default --scope-code=0 system/full_page_cache/caching_application 2
php bin/magento setup:config:set --http-cache-hosts=varnish:80

````
