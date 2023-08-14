{# normal distribution based on https://www.mssqltips.com/sqlservertip/4233/sql-server-tsql-code-to-generate-a-normal-distribution/ #}
{%- macro norminverse_cos(mean, stdev) -%}
sqrt(
    -2.0*
    log(random()))
*cos(
    2*pi()*random())
* {{stdev}} + {{mean}}
{%- endmacro -%}

{%- macro norminverse_sin(mean, stdev) -%}
sqrt(
    -2.0*
    log(random()))
*sin(
    2*pi()*random())
* {{stdev}} + {{mean}}
{%- endmacro -%}

{%- macro join_norminverse(n_iterations, mean, stdev) -%}
{% set half_iterations = n_iterations / 2 %}
(
SELECT
    UNNEST(range(cast({{half_iterations}} as int))) AS iteration,
    {{norminverse_cos(mean,stdev)}} AS norm_inverse

UNION ALL

SELECT
    unnest(range(cast({{half_iterations}} as int))) + {{half_iterations}},
    {{norminverse_sin(mean,stdev)}}
)
{%- endmacro -%}
