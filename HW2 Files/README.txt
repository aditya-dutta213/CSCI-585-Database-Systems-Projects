Q5) README

TO FIND: Which employees have always reported their health status as "well"?

ANSWER:
This involves table DIVISION as we want to find all instances (rows) of a certain condition (employees who have ALWAYS reported their health status as "well" in HealthStatus table).
To find this, we can use a query that involves dividing the `Employee` table by a derived table that contains all instances where the health status is not "well".
If an employee appears in the second table (denoting at least one instance of not being "well"), they will not appear in the result set.

QUERY USED(--Oracle LiveSQL) :

SELECT E.Name 
FROM Employee E
WHERE NOT EXISTS (
SELECT 1
FROM HealthStatus HS
WHERE HS.Status != 'well'
AND HS.EmployeeID = E.ID
);

In this query:
a)We select all rows from the `Employee` table (`E`).
b)We ensure no corresponding entries exist in the `HealthStatus` table (`HS`) where the status is not "well" using the `NOT EXISTS` and a subquery.
c)The subquery relates entries in the `HS` and `E` tables using the `EmployeeID` and `ID` fields respectively.

If a `Name` appears in the result, it indicates that they have always reported their status as "well". If they have ever reported a status other than "well", they will be excluded.