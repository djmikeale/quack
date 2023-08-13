#! /bin/bash

# duck db acting up. Delete db, recreate, load data
rm mikael.duckdb

# loads data using duckdb built-in connectors to csv & json, transforms the data with dbt
dbt build

# push data to apps using bash.
cd CV
./update_cv.sh
