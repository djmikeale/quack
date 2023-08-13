with
    source as (
        select * from {{ ref('raw_cv') }}

    ),

    clean as (
        select
            unnest(work_experience).company as company_name,
            unnest(work_experience).title as position,
            unnest(work_experience).location as location,
            unnest(work_experience).start_date as from_date,
            unnest(work_experience).end_date as to_date,
        from source
    ),

    transform as (
        select
            hash(company_name || position) as job_id,
            *
        from clean
    )

select *
from transform
