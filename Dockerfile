#GET IMAGE oficial prolog image
FROM ubuntu:16.04

MAINTAINER Silvio Cardoso <silvio.cardoso@list.lu>

# prepare OS
USER root
RUN apt-get update \ 
	&& apt-get install -y software-properties-common \ 
	&& add-apt-repository ppa:swi-prolog/stable \
	&& apt-get update \
	&& apt-get install -y swi-prolog git


# Set environment variables
ENV SHELL /bin/bash \ 
	&& CLIOPATRIA_DIR /opt/cliopatria \ 
	&& CLIOPATRIA_USER jovyan \ 
	&& CLIOPATRIA_UID 1000 \ 
	&& HOME /home/$CLIOPATRIA_USER \ 
	&& LANG en_US.UTF-8 \ 
	&& LANGUAGE en_US.UTF-8

# Create jovyan user with UID=1000 and in the 'users' group \ -N -u $CLIOPATRIA_UID
RUN useradd -m -s /bin/bash $CLIOPATRIA_USER \
  && mkdir -p $CLIOPATRIA_DIR \
  && chown $CLIOPATRIA_USER $CLIOPATRIA_DIR
USER $CLIOPATRIA_USER

#INSTALING CLIOPATRIA and  swish prolog interation with cliopatria
RUN git clone https://github.com/ClioPatria/ClioPatria.git $CLIOPATRIA_DIR \
  && cd $CLIOPATRIA_DIR \
  && git submodule update --init web/yasqe \
  && git submodule update --init web/yasr \
  && $CLIOPATRIA_DIR/configure \
  && swipl -s $CLIOPATRIA_DIR/run.pl cpack install swish \
  && chmod -R 775 $CLIOPATRIA_DIR 


EXPOSE 3020
EXPOSE 3050

WORKDIR /home/$CLIOPATRIA_USER

# Add startup script
CMD ["swipl","/opt/cliopatria/run.pl"]
