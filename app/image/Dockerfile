FROM openjdk:11

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY app/app.jar /usr/src/app/
COPY app/start.sh /usr/src/app/

RUN chmod -x /usr/src/app/start.sh

CMD [ "bash", "./start.sh" ]