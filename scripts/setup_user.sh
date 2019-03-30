#!/bin/bash

nohup gosu mongodb mongo testdb --eval "db.createUser({user: 'admin', pwd: 'insecure', roles:[{ role: 'root', db: 'testdb' }, { role: 'read', db: 'local' }]});"

nohup gosu mongodb mongo testdb --eval "db.createUser({ user: 'myuser', pwd: 'insecure', roles: [{ role: 'readWrite', db: 'testdb' }, { role: 'read', db: 'local' }]});"

nohup gosu mongodb mongo admin --eval "db.shutdownServer();"
