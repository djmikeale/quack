with jobs as (

    select * from {{ ref('stg_jobs') }}

),

jobs_transformed as (

    select
        *,
        datediff('month', from_date, COALESCE(to_date,current_date))/2 AS months_employment
    from jobs

),

final as (

    select
        company_name,
        position,
        from_date,
        to_date,
        repeat('█',months_employment) ||
            CASE WHEN to_date IS NULL 
                THEN '➝'
                ELSE '' 
            END AS '█ = 2 months'

    from jobs_transformed
)

select * from final order by from_date ASC
