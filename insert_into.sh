#! /bin/bash

SOURCE=$(<target/jobs.md)
TEMPLATE=$(<insertinto)
DESTINATION="insertinto"
echo "${TEMPLATE//\{\{jobs.csv\}\}/$SOURCE}" > $DESTINATION