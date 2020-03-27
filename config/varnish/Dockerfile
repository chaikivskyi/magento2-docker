FROM ubuntu:18.04

RUN apt-get update && apt-get install -y varnish
COPY ./start.sh /start.sh
COPY ./default.vcl /etc/varnish/default.vcl
RUN chmod +x /start.sh

CMD /start.sh