# Write your MySQL query statement below
# writing the brute force approch to solve
/*
select distinct l1.num as ConsecutiveNums
from Logs l1
join Logs l2 on l1.id = l2.id-1
join Logs l3 on l2.id = l3.id -1
where l1.num = l2.num and l2.num = l3.num; */

# solving the code using Window functions
# in order to find the next id/ next num in the given problem we have LEAD() function

select DISTINCT num as ConsecutiveNums
from (
select 
    num,id,
    LEAD(num,1) over(order by id) as next_num,
    LEAD(num,2) over(order by id) as next_next_num,
    LEAD(id,1) over(order by id) as next_id,
    LEAD(id,2) over(order by id) as next_next_id
    from Logs 
) t
where num = next_num and next_num = next_next_num
    and next_id = id+1 and next_next_id = id+2;
