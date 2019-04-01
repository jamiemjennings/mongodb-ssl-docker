FROM alpine:3.9 AS build

WORKDIR /home/mongodb

COPY scripts /home/mongodb/scripts

RUN ["apk", "--update", "add", "openssl"]

RUN ["chmod", "+x", "/home/mongodb/scripts/"]

RUN ["mkdir", "ssl"]

WORKDIR /home/mongodb/ssl 

RUN ["/home/mongodb/scripts/gen-certs.sh"]

FROM mongo:3.6-jessie AS prod

COPY scripts /home/mongodb/scripts

COPY --from=build /home/mongodb/ssl/*.pem /home/mongodb/ssl/

COPY mongod.conf /home/mongodb

WORKDIR /home/mongodb

RUN ["chmod", "+x", "/home/mongodb/scripts/"]

CMD ["/home/mongodb/scripts/run.sh"]
