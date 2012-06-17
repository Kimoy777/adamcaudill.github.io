chown -R www-data:www-data /var/www/adamcaudill.com/
find /var/www/adamcaudill.com/ -type d -exec chmod 755 {} \; && find /var/www/adamcaudill.com/ -type f -exec chmod 644 {} \;
