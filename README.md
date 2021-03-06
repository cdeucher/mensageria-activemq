#
## Point-to-Point (Queue)
#
<img src="img/start.jpeg"/>


```bash

## commands

kubectl port-forward svc/lb-activemq 8161:8161 -n dev
kubectl port-forward svc/lb-activemq 61616:61616 -n dev
kubectl port-forward deployment.apps/deploy-prometheus 9090:9090 -n dev
kubectl port-forward svc/lb-grafana 3000:3000 -n dev
kubectl port-forward svc/weave-scope-app 4040:80 -n weave

kubectl scale deployment deploy-app-receiver --replicas=1 -n dev
kubectl scale deployment deploy-app-receiver --replicas=10 -n dev



java -cp app.jar com.activemq.producer.Producer "bla.bla" 20 "tcp://localhost:61616"
java -cp app.jar com.activemq.consumer.Consumer "bla.bla" 20 "tcp://localhost:61616"

docker run -it --rm -eBROKER="tcp://activemq:61616" -eCLASS="com.activemq.consumer.Consumer" -eQUEUE="bla.bla" -eMSGS="1"  activemq:dev


kubectl get hpa -n dev
kubectl describe hpa -n dev
kube create -f app/scale-app-hpa-behavior.yml
```


#

## Message/Event
    Uma Message é um pequeno "pacote" com dados, este pacote é enviado a canais que se responsabilizam por entregar esses pacotes aos sistemas interessados.  
    Pode ser um JSON, XML ou qualquer tipo de formato em bytes.
    - Header
    - Properties
    - Body    

## Producer/Sender
    Producer é um programa que gera uma mensagem e transmite para o Message Broker.

## Channel (Queue/Topic)
    Caminho lógico utilizado para conectar o Producer ao Message Broker e transmitir a mensagem.
    
    - Queue

    - Topic
    
## Consumer/Receiver/Subscriber
    Consumer é um programa que recebe as mensagens e retira da Queue.

#
<img src="img/queue.png"/>

#

## Message Broker
    Um Message Broker nada mais é que um servidor de mensagens, responsável por garantir que a mensagem seja enfileirada e armazenada em disco (opcional), garantindo que ela fique lá enquanto necessário até que alguém (consumidor) a retire.
 
<img src="img/broker.png"/>

#

## Mensageria
    Mensageria é uma maneira de sistemas distribuidos se comunicarem por meio de troca de mensagens (event), sendo estas mensagens “gerenciadas” por um intermediário (Message Broker).
    
    - Resumo do editor: Usar a palavra mensageria pode ser uma forma de referênciar todos os 2 bilhões de termos técnicos do assunto.

#
<img src="img/features.jpeg"/>

#
## Mundo Real 

- Integrar sistemas desenvolvidos em tecnologias diferentes.

<img src="img/desacoplamento.jpg"/>

- Processar requisições de forma assíncrona e com escalabilidade.

<img src="img/scalle.png"/>


#
## Fontes
- Mensageria e Eventos: <a href="https://github.com/caelum/apostila-microservices-com-spring-cloud/blob/master/10-mensageria-e-eventos.md">link</a>
- Conceitos de Mensageria: <a href="https://pt.slideshare.net/waelsonn/1conceitos-de-mensageria">link</a>
- Mensageria: <a href="https://medium.com/@devbrito91/mensageria-1330c6032049">link</a>
- Enfileiramento de Mensagens: <a href="https://www.ibm.com/docs/pt-br/ibm-mq/9.0?topic=ssfksj-9-0-0-com-ibm-mq-pro-doc-q002620--htm">link</a>
- Point-to-Point Messaging: <a href="https://access.redhat.com/documentation/en-us/red_hat_amq/7.2/html/using_amq_broker/addresses">link</a>
- ActiveMQ, How do I preserve order of messages? <a href="https://activemq.apache.org/how-do-i-preserve-order-of-messages">link</a>
- <a href="">link</a>


#

## Advanced

#
## Message Oriented Middleware (MOM) <a href="https://activemq.apache.org/mom">link</a>
    Message Oriented Middleware (MOM) é um tipo de middleware orientado à mensagem. 

##  Java Message Service (JMS)
    Java Message Service, ou JMS, é uma API da linguagem Java para middleware orientado a mensagens. Através da API JMS, duas ou mais aplicações podem se comunicar por mensagens.

## Message (event)
    - A message is the unit of data which is sent between clients and servers.
    - A message has a body which is a buffer containing convenient methods for reading and writing data into it.

## Message Broker
    - Store and forward <a href="https://activemq.apache.org/how-do-distributed-queues-work">link</a><a href="https://livebook.manning.com/book/activemq-in-action/chapter-10/ch10lev2sec3">link</a>
   
## Point-to-Point - (Queue/Channel)
    With this type of messaging you send a message to a queue. 
    The message is then typically persisted to provide a guarantee of delivery, then some time later the messaging system delivers the message to a consumer. 

- If there are no consumers available at the time the message is sent it will be kept until a consumer is available that can process the message.<a href="https://activemq.apache.org/how-does-a-queue-compare-to-a-topic">link</a>
- If a consumer receives a message and does not acknowledge it before closing then the message will be redelivered to another consumer. <a href="https://activemq.apache.org/how-does-a-queue-compare-to-a-topic">link</a>

- <a href="https://www.enterpriseintegrationpatterns.com/patterns/conversation/FireAndForget.html">Fire-and-Forget</a>
- The Originator does not need to know anything about the Recipient
- The Fire-and-Forget conversation is stateless because there is no conversation state to be taken care of. 
- The simplicity and loose coupling of Fire-and-Forget comes at a price: error handling is not possible because there is no feedback regarding message delivery. 
- Point-to-Point Channel. <a href="https://github.com/caelum/apostila-microservices-com-spring-cloud/blob/master/10-mensageria-e-eventos.md">link</a>
- Competing Consumers.
- Message ordering. <a href="https://aws.amazon.com/pt/blogs/compute/implementing-fifo-message-ordering-with-amazon-mq-for-apache-activemq/">link</a>

- Resumo do editor: Pense em uma caixa cheia de cartas empilhadas em uma agência dos correios.


#
## Publish-Subscribe - (Topics, Pub/Sub, Channel)
- <a href="https://activemq.apache.org/how-does-a-queue-compare-to-a-topic">link</a>
- <a href="https://github.com/caelum/apostila-microservices-com-spring-cloud/blob/master/10-mensageria-e-eventos.md">link</a>

#
## Protocols
- Openwire: <a href="https://activemq.apache.org/wire-protocol">Link</a>
- Openwire is built ontop of TCP: <a href="https://activemq.apache.org/openwire">link</a>

<img src="img/activemqAndJMS.png"/>



## Skiped session
- The Publish-Subscribe Pattern 
    - skip
- Delivery guarantees    
    - skip
- Transactions
    - skip
- Durability
    - skip
- Messaging APIs and protocols
    - skip
- Routing <a herf="https://activemq.apache.org/components/artemis/documentation/2.0.0/address-model.html">Link</a>   
    - skip
- ...
    - skip

## Architecture
- 

## Concepts

- messaging-concepts:<a href="https://activemq.apache.org/components/artemis/documentation/2.0.0/messaging-concepts.html">Link</a>

#
##
<a href="https://pt.slideshare.net/bruce.snyder/enterprise-messaging-with-activemq-and-spring-jms">messaging-with-activemq-and-spring-jms</a>
<img src="img/messageprefetch.png">

A protocol - A set of rules.

AMQP - AMQP is an open internet protocol for reliably sending and receiving messages.

MOM (message-oriented-middleware) - is an approach, an architecture for distributed system i.e. a middle layer for the whole distributed system, where there's lot of internal communication (a component is querying data, and then needs to send it to the other component, which will be doing some processing on the data) so components have to share info/data among them.

Message broker - is any system (in MOM) which handles messages (sending as well as receiving), or to be more precise which routes messages to the specific consumer/recipient. A Message Broker is typically built upon a MOM. The MOM provides the base communication among the applications, and things like message persistence and guaranteed delivery. "Message brokers are a building block of Message oriented middleware."

Rabbitmq - a message broker; a MOM implementation; an open-source implementation of AMQP; as per Wikipedia:



