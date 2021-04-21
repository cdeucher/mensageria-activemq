#!/bin/bash 

#java -cp com.activemq.producer.Producer "bla.bla" 20 "tcp://activemq:61616"

if [ -z "$CLASS" ]; then
   echo "parameter CLASS is empty [com.activemq.producer.Producer or com.activemq.consumer.Consumer]"
   echo "starting default CLASS=com.activemq.consumer.Consumer"
   CLASS="com.activemq.consumer.Consumer"
fi

echo "loading class ${CLASS}, queue ${QUEUE}, msgs ${MSGS}, broker ${BROKER}"
echo "java -cp app.jar $CLASS $QUEUE $MSGS $BROKER"

java -cp app.jar "$CLASS" "$QUEUE" "$MSGS" "$BROKER"