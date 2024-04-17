--Oracle LiveSQL


SELECT SymptomID, COUNT(*) AS SymptomCount
FROM Symptom
GROUP BY SymptomID
ORDER BY SymptomCount DESC;
