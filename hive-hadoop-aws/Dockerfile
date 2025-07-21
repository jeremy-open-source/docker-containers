FROM maven:3.8.5-openjdk-17 AS builder

WORKDIR /build

COPY hive/pom.xml .

RUN mvn dependency:copy-dependencies -DoutputDirectory=target/jars

FROM apache/hive:3.1.3

ENV HIVE_AUX_JARS_PATH=/opt/hive/lib/ext

USER root

RUN mkdir -p /opt/hive/lib/ext

USER hive

# COPY --from=builder /build/target/jars /opt/hive/lib/ext
COPY --from=builder /build/target/jars/hadoop-aws-3.2.2.jar /opt/hive/lib/ext/
COPY --from=builder /build/target/jars/aws-java-sdk-bundle-1.11.1026.jar /opt/hive/lib/ext/
