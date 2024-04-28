with
    source as (select * from {{ source("raw", "cv.json") }}),

    jobs as (
        select
            unnest(work_experience).location as country,
            left(unnest(work_experience).start_date,4) as year
        from source
    ),

    countries_visited as (
        select
            unnest(countries_visited).location as country,
            unnest(countries_visited).year as year
        from source
    ),

    unioning as (
        select * from jobs
        --union all
        --select * from countries_visited
    ),


    transform as (select hash(country || year) as id, * from unioning)

select *
from transform
