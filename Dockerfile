FROM ubuntu
ENV TELEPORT_VERSION="15.3.1"
RUN apt update && \
    apt install -y curl && \
    apt install -y openssl
RUN curl https://goteleport.com/static/install.sh | bash -s ${TELEPORT_VERSION?}
#RUN openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=localhost"
#RUN teleport configure -o /etc/teleport/teleport.yaml \
#    --cluster-name=localhost \
#    --public-addr=localhost:443 \
#    --cert-file=/cert.pem \
#    --key-file=/key.pem
ENTRYPOINT [ "teleport", "start" ]