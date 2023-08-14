select *
from
    range(
        date {{ beginning_of_universe() }},
        current_date + interval 6 month,
        interval '1' day
    )
