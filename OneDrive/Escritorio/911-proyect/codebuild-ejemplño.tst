FROM 903171559802.dkr.ecr.us-east-1.amazonaws.com/php74:latest


RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer· | php -- \
     --install-dir=/usr/local/bin --filename=composer

COPY --from=903171559802.dkr.ecr.us-east-1.amazonaws.com/composer:latest /usr/bin/composer /usr/bin/composer


RUN apt-get update
RUN apt-get -y install vim

RUN a2enmod rewrite
COPY --from=903171559802.dkr.ecr.us-east-1.amazonaws.com/composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html/
RUN mkdir nueve11julasoft
WORKDIR /var/www/html/nueve11julasoft
COPY . .
RUN composer install
RUN composer update
RUN npm install
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf
EXPOSE 8000
RUN chmod 777 * /var/www/html/nueve11julasoft/public/ -R

