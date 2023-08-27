with
    source as (select * from {{ source("raw", "countries_emojis.csv") }}),

    clean as (
        select
            iso,emoji,name
        from source
    )

select *
from clean
