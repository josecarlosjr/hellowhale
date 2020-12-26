FROM nginx:1.19.6-alpine

#RUN apt-get update && apt-get install -y apt-transport-https software-properties-common
RUN apk update && apk add apt-transport-https software-properties-common

#RUN apt-get install -y vim net-tools

RUN rm /etc/nginx/nginx.conf

COPY wrapper.sh /

COPY nginx.conf /etc/nginx/

COPY html /usr/share/nginx/html

EXPOSE 443

EXPOSE 80

EXPOSE 8080

CMD ["./wrapper.sh"]
