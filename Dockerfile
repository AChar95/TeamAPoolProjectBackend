FROM ubuntu
USER root
RUN apt-get update
RUN useradd -m -s /bin/bash backend
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
WORKDIR /opt/pool-server
RUN chown -R backend:backend /opt/pool-server
USER backend
COPY . .
RUN npm install
EXPOSE 8080
ENTRYPOINT ["/usr/bin/node", "Index.js"]

