with source as (
    {#- read from seed #}
    select * from {{ ref('raw_jobs') }}

),

clean as (
    select
        company_name,
        position,
        from_date,
        company_name || position as job_id,
        NULLIF(to_date, '') as to_date
    from source
)

select * from clean
