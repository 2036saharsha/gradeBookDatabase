-- -- List all the students in a course and their scores on each assignment
SELECT 
    s.F_NAME AS First_Name,
    s.L_NAME AS Last_Name,
    a.ASSIGNMENT_NAME AS Assignment_Name,
    COALESCE(a.GRADE, 0) AS Grade
FROM 
    STUDENT s
JOIN 
    ENROLLMENT e ON s.STUDENT_ID = e.STUDENT_ID
JOIN 
    COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID
LEFT JOIN 
    GRADE g ON e.GRADE_ID = g.GRADE_ID 
LEFT JOIN 
    ASSIGNMENT a ON a.GRADE_ID = g.GRADE_ID
WHERE 
    cs.COURSE_NUM = 102 AND cs.SEMESTER = 'Spring 2025';