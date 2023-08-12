#! /bin/bash

python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
duckcli mikael.duckdb -e "INSTALL 'json'; LOAD 'json';"
read -s -p "Installations completed (hopefully lol). Press Enter to build dbt project and test that the documentation server is working"
dbt build
dbt docs generate
dbt docs serve
