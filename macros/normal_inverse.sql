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
(
SELECT 
    UNNEST(range({{n_iterations}})) AS iteration,
    {{norminverse_cos(mean,stdev)}} AS norm_inverse

UNION ALL

SELECT 
    unnest(range({{n_iterations}})),
    {{norminverse_sin(mean,stdev)}}
)
{%- endmacro -%}