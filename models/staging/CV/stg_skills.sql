with source as (
    select * from 'models/raw/source_data/raw_skills.csv'
),

clean as (
    select
        ordering,
        skill,
        skill_description,
        type,
        NULLIF(subtype, '') as subtype,
        NULLIF(abbreviation, '') as abbreviation,
        NULLIF(level_example, '') as level_example
    from source
)

select * from clean
