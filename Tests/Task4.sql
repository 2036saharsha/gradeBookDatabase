-- Test: Compute the average score for 'Homework 1'
SELECT AVG(GRADE) AS Avg_Score FROM ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 1';

-- Test: Compute the highest score for 'Homework 2'
SELECT MAX(GRADE) AS Max_Score FROM ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2';

-- Test: Compute the lowest score for 'Homework 2'
SELECT MIN(GRADE) AS Min_Score FROM ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2';
