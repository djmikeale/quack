

SELECT 
    *
FROM {{ref('year_spine')}}, {{join_norminverse(100,5,1)}}