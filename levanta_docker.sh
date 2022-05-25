#!/bin/bash
docker-compose down
rm -rf ./data/datanode_1
rm -rf ./data/datanode_2
rm -rf ./data/namenode
rm -rf ./data/nodemanager
rm -rf ./data/resourcemanager
docker-compose up &
