# DockerCliopatria
Build a docker image to [Cliopatria](https://github.com/ClioPatria/ClioPatria)

## Build the image:

 `docker build -t cliopatria .`
 
 
## Start the containers

####  using the startup script 
`create_container.sh`

OR

#### typing the commands
##### (This allow access of the prolog terminal):

`docker run --name "myCliopatria"  -p 3020:3020 -p 3050:3050  -v $PWD/storage/:/opt/cliopatria/storage/  -it  cliopatria`


##### Creating the container in daemon mode
##### (Without access to prolog terminal):

`docker run --name "myCliopatria"  -p 3020:3020 -p 3050:3050  -v $PWD/storage/:/opt/cliopatria/storage/  -d  cliopatria`

 
* Both will create the docker container and one folder (storage) where you can access the inserted triples
* All containers will have [swish](https://github.com/SWI-Prolog/swish)  instaled

# Pull it from dockerhub

`docker pull silviodc/cliopatria`
