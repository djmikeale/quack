with source as (select * from {{ ref('stg_education') }})

select institution, location, title, left(end_date,4) as year from source order by end_date desc limit 4
