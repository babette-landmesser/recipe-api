FROM node
MAINTAINER Babette Landmesser <mail@babettelandmesser.de>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

EXPOSE 7000
ADD ./* /home/node/app/
WORKDIR /home/node/app/
ENV NODE_ENV production
RUN npm install
CMD ["npm start"]

