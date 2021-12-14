FROM openjdk:8-alpine

WORKDIR /kafka-build

RUN mkdir -p logs/kafka logs/zookeeper

RUN apk add --no-cache libc6-compat curl libgcc zlib-dev bash wget && \
	wget https://archive.apache.org/dist/kafka/2.4.0/kafka_2.12-2.4.0.tgz && \
	tar xvf kafka_2.12-2.4.0.tgz --strip-components=1 && \
	rm -rf kafka_2.12-2.4.0.tgz

ADD https://raw.githubusercontent.com/backtrackshubham/docker-kafka/master/start-kafka .

RUN chmod 755 start-kafka

ENTRYPOINT bash start-kafka
