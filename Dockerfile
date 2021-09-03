FROM storm2/openresty-voms:latest

# support running as arbitrary user which belongs to the root group
RUN chmod g+rwx /usr/local/openresty-voms/nginx/logs /usr/local/openresty-voms/nginx/ /var/run

COPY ./assets/nginx.conf /usr/local/openresty-voms/nginx/conf/nginx.conf
COPY ./assets/voms-error-pages.conf /usr/local/openresty-voms/nginx/conf/voms-error-pages.conf
COPY ./assets/error /usr/local/openresty-voms/nginx/html/error/

EXPOSE 443

RUN usermod -aG root nginx
USER nginx
