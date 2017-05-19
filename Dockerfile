#GET IMAGE the oficial prolog image
FROM swipl/swipl

#Install github
RUN apt-get update && apt-get install -y git

#directory to install cliopatria
ENV CLIOPATRIA_DIR /opt/cliopatria

#Create the directory
RUN mkdir -p $CLIOPATRIA_DIR

#INSTALING CLIOPATRIA and Changing the folder privilegies to allow w.r.t

RUN git clone https://github.com/ClioPatria/ClioPatria.git $CLIOPATRIA_DIR \
  && cd $CLIOPATRIA_DIR \
  && git submodule update --init web/yasqe \
  && git submodule update --init web/yasr \
  && chmod -R 0755 $CLIOPATRIA_DIR 
  

#Expose the ports to outside
EXPOSE 3020
EXPOSE 3050

#Setting the work directory
COPY start.sh /usr/local/bin

RUN chmod -R 0755 /usr/local/bin/start.sh

#First command to start cliopatria
CMD start.sh
