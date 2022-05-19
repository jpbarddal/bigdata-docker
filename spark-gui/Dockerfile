FROM jpbarddal/spark-base:1.0

MAINTAINER Jean Paul Barddal <jpbarddal@gmail.com>

RUN pip install notebook

#COPY application.conf /opt/spark-notebook/conf/
#COPY clusters /opt/spark-notebook/conf/
#COPY profiles /opt/spark-notebook/conf/
#COPY jars /jars

#RUN mkdir -p /data/resources

#ENV NOTEBOOKS_DIR "/opt/spark-notebook/notebooks"
#ENV RESOURCES_DIR "/data/resources"
#ENV SPARK_MASTER "spark://spark-master:7077"
#ENV SPARK_EXECUTOR_MEMORY "4G"
#ENV EXTRA_CLASSPATH "/jars/*"

#WORKDIR /opt/spark-notebook/

EXPOSE 8080

COPY run.sh /run.sh
RUN chmod a+x /run.sh
CMD ["/run.sh"]
