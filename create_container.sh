#!/bin/sh
docker run --name "myCliopatria"  -p 3020:3020 -p 3050:3050  -v $PWD/storage/:/opt/cliopatria/storage/  -it  cliopatria
