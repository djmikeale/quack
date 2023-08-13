with source as (select * from {{ ref("stg_education") }})

select
    left(end_date, 4)
    || ' - '
    || institution
    || ' '
    || {{ country_to_flag("location") }} as institution,
    title
from source
order by end_date desc
limit 4
