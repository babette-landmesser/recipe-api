FROM node
MAINTAINER Babette Landmesser <mail@babettelandmesser.de>
<<<<<<< HEAD
# ENV DEBIAN_FRONTEND noninteractive

EXPOSE 7000
WORKDIR /home/node/app
ENV NODE_ENV production
ADD . /home/node/app/
# Install Dependencies
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install
CMD ["npm start"]
=======
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

EXPOSE 7000
ADD ./* /home/node/app/
WORKDIR /home/node/app/
ENV NODE_ENV production
RUN npm install
CMD ["npm start"]

>>>>>>> 9afb2c23250bcb5f80c6a429adf64653ee4b15b6
