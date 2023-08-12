with jobs as (

    select * from {{ ref('stg_jobs') }}

),

jobs_transformed as (

    select
        *,
        datediff(
            'month', from_date, coalesce(to_date, current_date)
        ) / 2 as months_employment
    from jobs

),

final as (

    select
        company_name as "Company Name",
        position as "Position",
        from_date,

        strftime(from_date, '%b %Y') as "Start Time",
        coalesce(strftime(to_date, '%b %Y'), 'Present') as "End Time",
        repeat('█', cast(months_employment as int)) as duration
    from jobs_transformed
)

select * exclude from_date from final order by from_date desc
