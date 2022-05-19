FROM apache/zeppelin:0.10.1
MAINTAINER Jean Paul Barddal <jpbarddal@gmail.com>

USER root
#RUN echo $USER
#RUN rm -r /zeppelin && mkdir /zeppelin

#COPY zeppelin-0.8.0-SNAPSHOT /zeppelin

#RUN chmod +x /zeppelin/bin/*

# RUN mkdir /tmp
# RUN chmod 777 /tmp

#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl

#RUN apt-get install -y net-tools curl
ENV HADOOP_MAJOR_VERSION=3.2
ENV HADOOP_VERSION=3.2.3
ENV SPARK_VERSION=3.2.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN chmod 777 /tmp
RUN set -x \
    && curl -fSL -k "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    # && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    # && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -zxvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
#RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

#RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1


ENV PATH $HADOOP_HOME/bin/:$PATH

#RUN apt-get update && apt-get install -y libsnappy-dev
#RUN ln -s /usr/lib/x86_64-linux-gnu/libsnappy.so /opt/hadoop-$HADOOP_VERSION/lib/native

#ADD /conf/hadoop/core-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml

RUN echo "https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}.tgz"
RUN wget --no-check-certificate https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION} /opt/zeppelin/spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}.tgz \
    && cd /

ENV SPARK_HOME /opt/zeppelin/spark
ENV PYTHONPATH $SPARK_HOME/python/lib

#RUN rm -r /opt/conda && wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh && \
#      /bin/bash Anaconda3-2022.05-Linux-x86_64.sh -b -p /opt/conda && \
#      conda update -y  -n base conda && conda install -y grpcio jupyter && \
#      rm Anaconda3-2022.05-Linux-x86_64.sh

COPY conf/zeppelin-site.xml /opt/zeppelin/conf/zeppelin-site.xml
COPY conf/interpreter.json /opt/zeppelin/conf/interpreter.json

ADD https://raw.githubusercontent.com/guilhem/apt-get-install/master/apt-get-install /usr/bin/
RUN chmod +x /usr/bin/apt-get-install

RUN apt-get update
RUN apt install -y software-properties-common
#RUN add-apt-repository ppa:deadsnakes/ppa
#RUN apt install -y python3.9
##RUN apt-get-install -y python3 python3-setuptools python3-pip
#RUN apt install -y python-is-python3
ENV PYTHONHASHSEED 1

RUN conda clean --all
RUN conda create --name py39 python=3.9
#SHELL ["/bin/bash", "-c", "conda", "activate", "py39"]

COPY entrypoint.sh ./
SHELL ["/bin/bash", "-c", "entrypoint.sh"]

#SHELL ["/bin/bash", "-c", "conda", "init", "bash"]
#RUN conda init bash
#RUN ["/bin/bash", "-c", "conda", "activate", "py39"]
SHELL ["/bin/bash", "-c", "conda", "install", "pyspark"]

#COPY entrypoint.sh ./
#RUN ["chmod", "+x", "entrypoint.sh"]
#ENTRYPOINT ["./entrypoint.sh"]
