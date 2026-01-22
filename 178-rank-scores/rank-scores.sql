/*You need AS "rank" (quotes are often necessary because "rank" can be a reserved keyword in some SQL dialects). */

select score,dense_rank() over(order by score DESC) as "rank"
from Scores