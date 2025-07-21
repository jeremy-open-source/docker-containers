FROM quay.io/jupyter/all-spark-notebook:spark-3.5.3

USER root

# Install Maven and cleanup
RUN   apt-get update \
  &&  apt-get install -y maven \
  &&  apt-get clean \
  &&  rm -rf /var/lib/apt/lists/*

# Create working directory for Maven dependency resolution
WORKDIR /tmp/deps

# Create a minimal pom.xml with necessary dependencies
RUN echo '<?xml version="1.0" encoding="UTF-8"?>\
<project xmlns="http://maven.apache.org/POM/4.0.0"\
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 \
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">\
  <modelVersion>4.0.0</modelVersion>\
  <groupId>custom.spark</groupId>\
  <artifactId>deps</artifactId>\
  <version>1.0.0</version>\
  <dependencies>\
    <dependency>\
      <groupId>org.apache.hadoop</groupId>\
      <artifactId>hadoop-aws</artifactId>\
      <version>3.3.4</version>\
    </dependency>\
    <dependency>\
      <groupId>org.apache.iceberg</groupId>\
      <artifactId>iceberg-spark-runtime-3.5_2.12</artifactId>\
      <version>1.5.0</version>\
    </dependency>\
    <dependency>\
      <groupId>software.amazon.awssdk</groupId>\
      <artifactId>s3</artifactId>\
      <version>2.20.134</version>\
    </dependency>\
  </dependencies>\
</project>' > pom.xml

# Download dependencies
RUN mvn dependency:copy-dependencies -DoutputDirectory=/usr/local/spark/jars

# Clean up
WORKDIR /home/jovyan/work
# RUN rm -rf /tmp/deps

# Config
ENV SPARK_CONF_DIR=/opt/spark/conf
COPY jupyter/spark-defaults.conf /opt/spark/conf/

USER $NB_UID

# Remove newsletter
RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"
