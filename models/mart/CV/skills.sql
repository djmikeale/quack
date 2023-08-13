with
    source as (select * from {{ ref("stg_skills") }}),

    final as (
        select
            case
                when abbreviation is null then skill else abbreviation || ' - ' || skill
            end as skill,
            level_example as "Competence Level Example",
            skill_description as "Description",
            type as "Type",
            subtype as "Subtype"
        from source
        where ordering < 3
        order by ordering asc, skill asc
    )

select *
from final
