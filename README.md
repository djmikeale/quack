# Cloud Data warehouse is so last year, local dwh ftw!

_This repo is a self-contained dwh, utilizing DuckDB, some shell scripting, and more._

Built on top of [dbt's duckDB jaffle shop](https://github.com/dbt-labs/jaffle_shop_duckdb)


## What's this repo?

What this repo _is_:
- A data warehouse for me to test out ideas and play around, and hopefully for you to get a bit inspired.

What this repo _is not_:
- A well-tested, secure and performant solution, guaranteed to work on your machine.


## What's in this repo?
- currently the only data in here is parts of [my CV](CV/CV.md).

<details>
<summary>

Todos:
</summary>

Contents
  - jobs pivoted w descriptions
  - technologies used
  - interests
  - proudest moments / key achievements
    - Number of people I've convinced to use bicycle helmets
    - Kids
- TODO:
  - Link to metadata.md
    - link to .md in each folder (staging, mart)
    - descriptive statistics on dbt project
    - test and documentation coverage
    - paths https://duckdb.org/docs/sql/query_syntax/with


Metadata.md

Probability Monte Carlo simulations
- column macros - standard int column Xjoin generateseries(), or join two columns and multiply probabilities across tables
- output csv and create probability distribution graph image based on csv output https://github.com/glamp/bashplotlib https://github.com/nk412/quickhist


</details>

# Getting your hands dirty

<details>
<summary>

## Install & deploy in < 1 min </summary>

| ⚠️ | Prerequisitie: Python >= 3.5 |
| --- | :--------------------------- |



### bash/zsh:

```shell
git clone https://github.com/djmikeale/quack.git
cd quack
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
duckcli mikael.duckdb -e "INSTALL 'json'; LOAD 'json';"
dbt build
```

### Windows cmd.exe:

```shell
git clone https://github.com/djmikeale/quack.git
cd quack
python -m venv venv
venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
venv\Scripts\activate.bat
duckcli mikael.duckdb -e "INSTALL 'json'; LOAD 'json';"
dbt build
```

</details>

<details>
<summary>

## Browsing the data

</summary>
View db data:

```shell
duckcli mikael.duckdb -e "select * from jobs limit 1" -t
```

View documentation + tests:

```shell
dbt docs generate
dbt docs serve
```

</details>

<details>
<summary>

## Bells and whistles

</summary>

The `vscode-yaml` YAML, combined with the JSON schema defined in [dbt-labs/dbt-jsonschema](https://github.com/dbt-labs/dbt-jsonschema), autocomplete options while working with dbt's YAML files: i.e. :
    - Project definition files (`dbt_project.yml`)
    - Package files (`packages.yml`)
    - Selectors files (`selectors.yml`)
    - Property files (`models/whatever.yml`)

</details>
