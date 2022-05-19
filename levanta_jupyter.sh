#!/bin/bash
CONTAINER_ID=$(docker ps | grep pyspark | head -n1 | cut -d " " -f1)
TOKEN=$(docker logs  ${CONTAINER_ID} 2>&1 | grep "token=" | head -n1 | cut -d "=" -f2)
firefox --new-tab http://localhost:50070 --new-tab http://localhost:8989 --new-tab http://localhost:7077 --new-tab http://localhost:8088 --new-tab http://localhost:50080?token=${TOKEN}
