FROM node
MAINTAINER Babette Landmesser <mail@babettelandmesser.de>
# ENV DEBIAN_FRONTEND noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install Node
ENV PATH $PATH:/usr/bin/node

# Install Dependencies
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install

