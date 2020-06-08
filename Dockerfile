FROM openjdk:8-alpine

WORKDIR /kafka-build

RUN mkdir -p logs/kafka logs/zookeeper

RUN apk add --no-cache libc6-compat libgcc zlib-dev bash wget && \
	wget http://apachemirror.wuchna.com/kafka/2.4.0/kafka_2.12-2.4.0.tgz && \
	tar xvf kafka_2.12-2.4.0.tgz --strip-components=1 && \
	rm -rf kafka_2.12-2.4.0.tgz

ADD https://gist.githubusercontent.com/shubhamknoldus/83c1dd9c241d27bbc61237d802c32114/raw/bdbcddddbfbbd91a64403ee71918a12b4c0b2df7/server.properties config/

ADD https://gist.githubusercontent.com/shubhamknoldus/83c1dd9c241d27bbc61237d802c32114/raw/bdbcddddbfbbd91a64403ee71918a12b4c0b2df7/start-kafka .

RUN chmod 755 start-kafka

ENTRYPOINT bash start-kafka