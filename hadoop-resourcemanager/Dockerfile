FROM jpbarddal/hadoop-base:1.0
MAINTAINER Jean Paul Barddal <jpbarddal@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088
EXPOSE 8030
EXPOSE 8032
EXPOSE 8031

CMD ["/run.sh"]
