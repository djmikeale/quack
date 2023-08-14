with
    source as (select * from {{ ref("raw_cv") }}),

    clean as (
        select
            {% for column in [
                "type",
                "institution",
                "location",
                "title",
                "start_date",
                "end_date",
                "details",
            ] %}
            unnest(education).{{ column }} as {{ column }},  -- loving how duckdb doesn't care about ending a sql statement with a comma, lol.
            {% endfor %}
        from source
    ),

    transform as (select hash(end_date) as id, * from clean)

select *
from transform
