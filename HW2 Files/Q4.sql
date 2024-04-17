--Oracle LiveSQL


SELECT COUNT(*) AS "Number of Scans"
FROM Scan
WHERE ScanDate BETWEEN TO_DATE('2023-09-27', 'YYYY-MM-DD') 
AND TO_DATE('2023-10-08', 'YYYY-MM-DD');

SELECT COUNT(*) AS "Number of Tests"
FROM Test
WHERE TestDate BETWEEN TO_DATE('2023-09-27', 'YYYY-MM-DD') 
AND TO_DATE('2023-10-08', 'YYYY-MM-DD');

SELECT COUNT(DISTINCT EmployeeID) AS "Number of Employees Reported Symptoms"
FROM Symptom
WHERE DateReported BETWEEN TO_DATE('2023-09-27', 'YYYY-MM-DD') 
AND TO_DATE('2023-10-08', 'YYYY-MM-DD');

SELECT COUNT(*) AS "Number of Positive Cases"
FROM Test
WHERE TestDate BETWEEN TO_DATE('2023-09-27', 'YYYY-MM-DD') 
AND TO_DATE('2023-10-08', 'YYYY-MM-DD') 
AND TestResult = 'positive';
