#docker build -t activemq:dev .
FROM rmohr/activemq:5.15.9

ENV ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161
ENV ACTIVEMQ_HOME /opt/activemq

ENV CONFIG=config.yaml
ENV AGENT=jmx_prometheus_javaagent-0.9.jar
ENV AGENT_PORT=8080
ENV AGENT_OPTS="-javaagent:/$AGENT=$AGENT_PORT:/$CONFIG"

#https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.9/
COPY $AGENT /
COPY $CONFIG /
USER root

USER activemq
WORKDIR $ACTIVEMQ_HOME
EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI $AGENT_PORT

ENV ACTIVEMQ_OPTS_MEMORY="-Xms64M -Xmx1G"
ENV ACTIVEMQ_CONF=$ACTIVEMQ_HOME/conf
ENV ACTIVEMQ_OPTS="$AGENT_OPTS $ACTIVEMQ_OPTS_MEMORY -Djava.util.logging.config.file=logging.properties -Djava.security.auth.login.config=$ACTIVEMQ_CONF/login.config"

CMD ["/bin/sh", "-c", "bin/activemq console"]