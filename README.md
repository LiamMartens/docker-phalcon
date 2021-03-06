# PHP Phalcon
This image is built on `Alpine` and contains `PHP` and the `Phalcon` framework.

## Build arguments
* `USER`: The non-root user to be used in the container
* `PHPV`: The PHP version number for selecting the `Alpine` packages
* Any build arguments from the `Alpine` base image [liammartens/alpine](https://hub.docker.com/r/liammartens/alpine/)

## Directories
* `/etc/php[PHP_VERSION]`: For PHP configuration files (default files are copied in if volume is not used)
* `/var/www`: For web content

## Logging
Default `PHP-FPM` configuration files are setup to send the logs to `/proc/self/fd/2`, which is `stdout` for docker.

## Environment
You can control the PHP configuration using environment variables. Aside from that the `php-fpm` bind IP is automatically set to the container IP.
If you want to override certain PHP configuration variables you can pass them in the following environment variable format `PHP_ZLIB__OUTPUT_COMPRESSION` which will change the `zlib.output_compression` setting in the `php.ini` file. You can also override the port using the `PHP_PORT` environment variable. Other environment variables not prefixed with `PHP_` will be added to the `env.conf` file to pass them to the PHP server for access in your PHP scripts.