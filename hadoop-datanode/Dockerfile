FROM jpbarddal/hadoop-base:1.0
MAINTAINER Jean Paul Barddal

HEALTHCHECK CMD curl -f http://localhost:50075/ || exit 1
#HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50075
#EXPOSE 8042

CMD ["/run.sh"]
