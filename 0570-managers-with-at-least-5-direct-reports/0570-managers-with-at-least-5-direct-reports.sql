SELECT e.name 
FROM employee e  -- <--- Make sure "e" is right here!
JOIN employee emp ON e.id = emp.managerId
GROUP BY e.id, e.name
HAVING COUNT(emp.id) >= 5;