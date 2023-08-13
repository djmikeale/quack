select range as 'year_id'
from
    range(
        date '{{ var(' start_date ') }}',
        date '{{ var(' end_date ') }}',
        interval '1' year
    )
