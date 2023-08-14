select *
from
    range(
        date '{{ var("start_date") }}',
        current_date + interval 6 month,
        interval '1' day
    )
