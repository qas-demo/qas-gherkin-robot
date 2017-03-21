FROM ubuntu:latest

LABEL Name=robot-docker-base
LABEL Description="Base image containing ability to execute Robot Framework test cases"

#Install base packages
RUN apt-get -y update \
    && apt-get install -y \
       python \
       python-pip \
       dos2unix \
    && rm -rf /var/lib/apt/lists/*

#Set working directory
WORKDIR /home/

#Add default files to image
ADD lint-rules .
ADD requirements .
ADD step-definitions/ step-definitions/


#Install base image pip packages
RUN pip install -r requirements

#add entrypoint shell script to image
COPY entrypoint.sh entrypoint.sh

#Remove \r EOL character before using the shell file in linux environment
RUN dos2unix entrypoint.sh \
    && apt-get --purge remove -y dos2unix \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7070:7070

###ONBUILD instructions

#Add contents on build folder for any images that inherit this image
ONBUILD ADD . /home/

#Each child project should specify what's required to install from pip
ONBUILD RUN pip install -r requirements


ENTRYPOINT ["/home/entrypoint.sh"]
CMD ["/bin/bash"]