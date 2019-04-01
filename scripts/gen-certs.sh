#!/bin/sh

CERT_SUBJECT="/C=EX/ST=EX/L=Example/O=Example Org/OU=Example OU/CN=mongo.example"

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.pem -subj "$CERT_SUBJECT"

openssl genrsa -out mongodb.key 2048
openssl req -new -key mongodb.key -out mongodb.csr -subj "$CERT_SUBJECT"
openssl x509 -req -in mongodb.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out mongodb.crt -days 500 -sha256
cat mongodb.key mongodb.crt > mongodb.pem

