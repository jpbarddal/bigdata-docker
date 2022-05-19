#!/bin/bash
CONTAINER_ID=$(docker ps | grep pyspark | head -n1 | cut -d " " -f1)
TOKEN=$(docker logs  ${CONTAINER_ID} 2>&1 | grep "token=" | head -n1 | cut -d "=" -f2)
firefox --url http://localhost:50070 http://localhost:8989 http://localhost:8088 http://localhost:50080?token=${TOKEN}
