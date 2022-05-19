#!/bin/bash
CONTAINER_ID=$(docker ps | grep pyspark | head -n1 | cut -d " " -f1)
TOKEN=$(docker logs  ${CONTAINER_ID} 2>&1 | grep "token=" | head -n1 | cut -d "=" -f2)
firefox --new-tab http://localhost:50080?token=${TOKEN}