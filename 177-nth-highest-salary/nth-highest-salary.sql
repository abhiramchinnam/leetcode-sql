CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT DISTINCT salary
      FROM (
          SELECT 
              salary, 
              DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
          FROM Employee
      ) AS ranked_salaries
      WHERE rnk = N
  );
END