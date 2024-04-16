-- Average score of an assignment
SELECT ROUND(AVG(GRADE), 2) AS average_score
FROM ASSIGNMENT;

-- Highest score of an assignment
SELECT MAX(GRADE) AS highest_score
FROM ASSIGNMENT;

-- Lowest score of an assignment
SELECT MIN(GRADE) AS lowest_score
FROM ASSIGNMENT;
