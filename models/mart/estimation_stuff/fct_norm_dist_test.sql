select hash(year_id || iteration) as id, year_id, iteration, norm_inverse
from {{ ref("stg_year_spine") }}, {{ join_norminverse(100, 5, 1) }}
