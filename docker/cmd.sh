#!/bin/bash

set -eu

case $1 in
    "build")
        docker build -t nagaita/postgres . ;;
    "run")
        docker run --name pgtuto -p 5432:5432 -d nagaita/postgres ;;
    "psql")
        docker exec -it pgtuto psql -d dvdrental -h localhost -U postgres ;;
    "bash")
        docker exec -it pgtuto bash ;;
    "stop")
        docker stop pgtuto ;;
    "rm")
        docker rm pgtuto ;;
    *)
        echo "[ERROR] Given argument '$1' does not support."; exit 1 ;;
esac
