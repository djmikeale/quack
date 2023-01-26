with source as (
    {#- read from seed #}
    select * from {{ ref('raw_jobs') }}

),

clean as (
    select
        company_name || position AS job_id,
        company_name,
        position,
        from_date,
        NULLIF(to_date,'') AS to_date
    from source
)

select * from clean
