FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

EXPOSE 443

CMD ["./wrapper.sh"]
