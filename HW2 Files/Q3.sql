--Oracle LiveSQL

SELECT e.FloorNumber, COUNT(s.SymptomID) AS SymptomCount
FROM Employee e
JOIN Symptom s ON e.ID = s.EmployeeID
GROUP BY e.FloorNumber
ORDER BY SymptomCount DESC;