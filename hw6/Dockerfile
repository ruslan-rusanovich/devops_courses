FROM nginx

COPY my_nginx.conf /etc/nginx/conf.d/
COPY my_index.html /usr/share/nginx/html

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx" "-g" "daemon off;"]
