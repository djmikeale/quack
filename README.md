# Cloud Data warehouse is so last year, local dwh ftw!

_This repo is a self-contained dwh, utilizing DuckDB, some shell scripting, and more._

Built on top of [dbt's duckDB jaffle shop](https://github.com/dbt-labs/jaffle_shop_duckdb)

## 

<details>
<summary>

## What is this repo?

</summary>

What this repo _is_:
- A data warehouse for me to test out ideas and play around, and hopefully for you to get a bit inspired.

What this repo _is not_:
- A well-tested, secure and performant solution, guaranteed to work on your machine.

</details>

<details>
<summary>

## What's in this repo?
  
</summary>

Contents
- CV
  - jobs overview
  - jobs pivoted w descriptions
  - technologies used
  - interests
  - proudest moments / key achievements
    - Number of people I've convinced to use bicycle helmets
    - Kids
- TODO: 
  - move notes/TODO to issues
  - Link to metadata.md
    - link to .md in each folder (staging, mart)
    - descriptive statistics on dbt project 
    - test and documentation coverage
    - paths https://duckdb.org/docs/sql/query_syntax/with
  - Description of project
  - Installation instructions
  




random scribles:

2️⃣0️⃣2️⃣0️⃣ 2️⃣0️⃣2️⃣1️⃣ 2️⃣0️⃣2️⃣2️⃣

◼️◼️◼️◼️ 🌷☀️🍂❄️ 🌷◼️◼️◼️

◼️◼️🍂❄️ 🌷☀️

- template with {{\comment - describing where the value is taken from? }} Or embed it somehow to slow lineage

Metadata.md

Probability Monte Carlo simulations
- column macros - standard int column Xjoin generateseries(), or join two columns and multiply probabilities across tables
- output csv and create probability distribution graph image based on csv output https://github.com/glamp/bashplotlib https://github.com/nk412/quickhist


This repo contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app along with some basic dbt [models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models), tests, and docs for this data.

The raw data consists of customers, orders, and payments, with the following entity-relationship diagram:

![Jaffle Shop ERD](/etc/jaffle_shop_erd.png)

</details>

# Get your hands dirty

<details>
<summary>

## Run this project</summary>

Prerequisities: Python >= 3.5

### bash/zsh:

```shell
git clone https://github.com/djmikeale/quack.git
cd quack
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
dbt build
dbt docs generate
dbt docs serve
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
dbt build
dbt docs generate
dbt docs serve
```

</details>

<details>
<summary>

## Generate and view the documentation for the project

</summary>

```shell
dbt docs generate
dbt docs serve
```

</details>
</details>
<details>
<summary>

## Browsing the data

</summary>

Launch a DuckDB command-line interface (CLI):
```shell
duckcli jaffle_shop.duckdb
```
Run a query at the prompt and exit:
```
select * from customers where customer_id = 42;
exit;
```
Alternatively, use a single-liner to perform the query:
```shell
duckcli jaffle_shop.duckdb -e "select * from customers where customer_id = 42"
```
or:
```shell
echo 'select * from customers where customer_id = 42' | duckcli jaffle_shop.duckdb
```

Furthermore, the following options exist:
- [DuckDB CLI](https://duckdb.org/docs/installation/?environment=cli)
- [How to set up DBeaver SQL IDE for DuckDB](https://duckdb.org/docs/guides/sql_editors/dbeaver)

</details>

<details>
<summary>

## Bells and whistles

</summary>

There's some bells and whistles defined in the [.devcontainer.json]().devcontainer.json) that are worth calling out. Also a great reference is the [Setting up VSCode for dbt](https://dbt-msft.github.io/dbt-msft-docs/docs/guides/vscode_setup/) guide.

1. there is syntax highlighting provided by the `vdcode-dbt` extension. However, it is configured such that files in your `target/run` and `target/compiled` folder are not syntax highlighted, as a reminder that these files are not where you should be making changes!
2. basic `sqlfluff` linting is enabled as you type. Syntax errors will be underlined in red at the error, and will also be surfaced in the **Problems** tab of the Terminal pane. It's configured to lint as you type.
3. Autocompletion is enabled for generic dbt macros via the `vdcode-dbt` extension. For example, if you type `macro` you'll notice a pop up that you can select with the arrow keys then click tab to get a macro snippet.
  ![image](https://user-images.githubusercontent.com/8158673/181362230-2c00d666-6131-4619-93aa-2e30d9c2bfea.png)
  ![image](https://user-images.githubusercontent.com/8158673/181362274-fa7d71ff-07fc-4b4a-97c3-a0464fbe4c7d.png)
4. the `find-related` extension allows an easy shortcut to navigating using `CMD`+`R`to jump from
    - a model file to it's corresponding compiled version,
    - from a compiled file to either the original model file or the version in `target/run`
5. The `vscode-yaml` YAML, combined with the JSON schema defined in [dbt-labs/dbt-jsonschema](https://github.com/dbt-labs/dbt-jsonschema), autocomplete options while working with dbt's YAML files: i.e. :
    - Project definition files (`dbt_project.yml`)
    - Package files (`packages.yml`)
    - Selectors files (`selectors.yml`)
    - Property files (`models/whatever.yml`)

</details>
