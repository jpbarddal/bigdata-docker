FROM jpbarddal/spark-base:1.0

MAINTAINER Jean Paul Barddal <jpbarddal@gmail.com>

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]
