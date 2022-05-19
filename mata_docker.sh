#!/bin/bash
docker-compose down
docker kill $(docker ps -q)
