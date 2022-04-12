#! /bin/bash

envsubst < /usr/local/signaturepdf/config/apache.conf > /etc/apache2/sites-available/signaturepdf.conf

envsubst < /usr/local/signaturepdf/config/php.ini > /usr/local/etc/php/conf.d/uploads.ini

envsubst < /usr/local/signaturepdf/config/config.ini.tpl > /usr/local/signaturepdf/config/config.ini

chown -R www-data:www-data /usr/local/signaturepdf && chmod 750 -R /usr/local/signaturepdf

if [[ ! -z $PDF_STORAGE_PATH ]] ; then
    mkdir -p $PDF_STORAGE_PATH
    chown -R www-data:www-data $PDF_STORAGE_PATH
    chmod 750 -R $PDF_STORAGE_PATH
fi

apache2-foreground
