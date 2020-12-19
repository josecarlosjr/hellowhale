FROM nginx

RUN apt-get update && apt-get install net-tools

COPY wrapper.sh /

COPY html /usr/share/nginx/html

EXPOSE 443

EXPOSE 80

EXPOSE 8080

CMD ["./wrapper.sh"]
