#! /bin/bash

# duck db acting up. Delete db, recreate, load data
rm mikael.duckdb
dbt compile --no-version-check --no-introspect
duckcli mikael.duckdb -e "DROP TABLE IF EXISTS cv; CREATE TABLE cv AS SELECT * FROM 'cv/source_data/cv2.json';"
dbt run
