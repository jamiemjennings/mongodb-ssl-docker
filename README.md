# mongodb-ssl-docker
MongoDB with self-signed SSL in a docker container. For test purposes only - do not use in production.

# Execution
To start a mongodb instance on port 27017 use the following command:
```
docker run -d -p 27017:27017 --name test-mongossl jamiemjennings/mongodb-ssl-docker:latest
```

Note that this will use the self-signed certificates pre-built into the image which is convenient, but poor from a security standard. You may easily generate unique self-signed certificates simply by rebuilding the image yourself (the Docker build generates new certificates). Use a custom tag for the new build so you know you are using your own certs:

```
docker build -t jamiemjennings/mongodb-ssl-docker:mycerts .
```

then run with:

```
docker run -d -p 27017:27017 --name test-mongossl jamiemjennings/mongodb-ssl-docker:mycerts
```

# User Credentials

Usernames and passwords are defined here (feel free to adjust and rebuild to suit your needs):
https://github.com/jamiemjennings/mongodb-ssl-docker/blob/8a995f81581d6236d4b994e18cedadf38c4935bd/scripts/setup_user.sh#L3-L5

The default credentials
| Username | Password |
| -------- | -------- |
| admin    | insecure |
| myuser   | insecure |
