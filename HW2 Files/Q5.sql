--Oracle LiveSQL

SELECT E.Name 
FROM Employee E
WHERE NOT EXISTS (
SELECT *
FROM HealthStatus HS
WHERE HS.Status != 'well'
AND HS.EmployeeID = E.ID
);