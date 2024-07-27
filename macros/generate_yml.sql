-- run using e.g.
-- dbt run-operation generate_yml --args '{"model_names": ["s_internal_transfer"]}' -t unstable
-- only tested on redshift adapter; seems not to work with duckdb 🫠
-- modified from original by dbt-labs/codegen:
  -- removed nesting functionality as I didn't need it
  -- added standard_column_docs to pre-populate columns with common docs
  -- added meta dict

{% macro generate_yml(model_names=[]) %}

    -- use the following command to get overview of all docsblocks in a kinda-structured way; run in root dir of project
    -- awk '/{% docs/,/{% enddocs %}/ {if (NF && !/% enddocs %/) printf "%s ", $0; else if (NF) print ""}' ./**/*.md | sed -E 's/ +/ /g' | sed -E 's/ *{% docs ([^ ]*) %} (.*)/\1\t\2/' | cut -c -300 | sort
    -- insert these below to pre-populate those columns

    {% set standard_column_docs = {
        "_eventid":       "{{doc('column__events__event_id')}}",
        "_sequence":      "{{doc('column__events__sequence')}}",
        "_timestamp":     "{{doc('column__events__timestamp')}}",

        "account_id":     "{{doc('column__account_id')}}",
        "user_id":        "{{doc('column__user_id')}}",

        "amount":         "{{doc('column__amount')}}",
        "currency":       "{{doc('column__currency')}}",
        "transfer_id":    "{{doc('column__transaction_id')}}",
    } %}

    {% set model_yaml = [] %}
    {% do model_yaml.append("version: 2") %}
    {% do model_yaml.append("models:") %}
    {% if model_names is string %}
        {{exceptions.raise_compiler_error("The `model_names` argument must always be a list, even if there is only one model.")}}
    {% else %}
        {% for model in model_names %}
            {% do model_yaml.append("  - name: " ~ model | lower) %}
            {% do model_yaml.append('    description: ""') %}
            {% do model_yaml.append("    meta: ") %}
            {% do model_yaml.append('      domain: ""') %}
            {% do model_yaml.append('      owner: ""') %}
            {% do model_yaml.append('      criticality: ""') %}
            {% do model_yaml.append('      contains_pii: ""') %}
            {% do model_yaml.append("    columns:") %}
            {% set relation = ref(model) %}
            {%- set columns = adapter.get_columns_in_relation(relation) -%}
            {% for column in columns %}
                {% do model_yaml.append("      - name: " ~ column.name | lower) %}
                {% do model_yaml.append('        description: "' ~ standard_column_docs.get(column.name | lower, "") ~ '"') -%}
            {% endfor %}
        {% endfor %}
    {% endif %}
    {% if execute %}
        {% set joined = model_yaml | join("\n") %}
        {{ log(joined, info=True) }}
        {% do return(joined) %}
    {% endif %}
{% endmacro %}
