-- Multiline query
SELECT 
    AVG(a.GRADE) AS Average_Grade,
    MIN(a.GRADE) AS Minimum_Grade,
    MAX(a.GRADE) AS Maximum_Grade
FROM 
    ENROLLMENT AS e 
JOIN 
    COURSE_SCHEDULE AS cs ON cs.SCHEDULE_ID = e.SCHEDULE_ID 
JOIN 
    COURSE AS c ON c.COURSE_NUM = cs.COURSE_NUM 
JOIN 
    ASSIGNMENT AS a ON a.GRADE_ID = e.GRADE_ID
WHERE 
    a.ASSIGNMENT_NAME = 'Homework 2' 
    AND c.COURSE_NAME = 'Advanced Database Systems' 
    AND cs.SEMESTER = 'Spring 2025'
    AND a.GRADE IS NOT NULL;
