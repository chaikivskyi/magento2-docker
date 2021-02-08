FROM linuxbrew/brew:latest
RUN brew install mkcert
COPY generate-certificate.sh /generate-certificate.sh
RUN ["chmod", "+x", "/generate-certificate.sh"]
CMD /generate-certificate.sh
