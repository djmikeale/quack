#! /bin/bash

# Extracts data from sources using seeds, transforms the data with dbt, push data to apps using bash.

dbt build

cd CV

./update_cv.sh