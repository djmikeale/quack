select range as 'year_id'
from
    range(
        date {{ beginning_of_universe() }},
        date {{ end_of_universe() }},
        interval '1' year
    )
