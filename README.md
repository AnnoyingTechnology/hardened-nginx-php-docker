# Hardened Nginx + PHP docker-compose.yaml

This should serve as a basis with sane defaults.
**Customize to your heart's contempt.**

# Security disclaimer

You **must** generate a new dhparam and certificates. 

Default ones in `certs/` are only provided for convenience and quickly get a working local environment.
You can even regenerate temporary ones by uncommenting the `cert-generator` section in `docker-compose.yml` 

# PHP Hardening

## Hard-Set settings 

The following settings are **hard-set** and **cannot** be changed by your PHP application using `ini_set`.

```c
php_admin_value[open_basedir] = "/var/www:/tmp/"
php_admin_value[upload_tmp_dir] = "/tmp/"
php_admin_value[disable_functions] = "exec, system, shell_exec, passthru, phpinfo, show_source, eval, highlight_file, popen, proc_open, allow_url_fopen, assert, mail, pcntl_exec, fopen_with_path, dl, link, symlink, unlink"
php_admin_value[max_execution_time] = 5
php_admin_value[memory_limit] = 256M
php_admin_value[error_log] = "/var/log/php.log"
php_admin_value[session.cookie_samesite] = "Strict"
php_admin_flag[session.cookie_secure] = on
php_admin_flag[session.cookie_httponly] = on
php_admin_flag[expose_php] = off
php_admin_flag[allow_url_fopen] = off
php_admin_flag[allow_url_include] = off
php_admin_flag[display_startup_errors] = off
php_admin_flag[display_errors] = off
php_admin_flag[log_errors] = on
```

## Soft-Set settings

The following settings are **soft-set** and **can** be changed by your PHP application using `ini_set`.

Please be mindful of the implies security risks. 

```ini
upload_max_filesize = 2M
max_file_uploads = 4
post_max_size = 2M
file_uploads = On
html_errors = Off
log_errors = On
error_reporting = E_ALL
max_input_time = 5
max_input_vars = 512
```