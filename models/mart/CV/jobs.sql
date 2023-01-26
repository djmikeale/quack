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
        company_name AS "Company Name",
        position AS Position,
        strftime(from_date, '%b %Y') AS "Start Time",
        
        coalesce(strftime(to_date, '%b %Y'),'Present') AS "End Time",
        repeat('█',months_employment) AS "Duration",
        from_date,
    from jobs_transformed
)

select * exclude from_date from final order by from_date ASC
