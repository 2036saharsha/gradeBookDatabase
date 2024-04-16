-- Test case to verify assignment insertion for a specific course and semester

-- Test setup: Insert necessary data for testing
INSERT INTO COURSE (COURSE_NUM, COURSE_NAME) VALUES ('CS101', 'Introduction to Computer Science');
INSERT INTO COURSE_SCHEDULE (SCHEDULE_ID, COURSE_NUM, SEMESTER) VALUES (1, 'CS101', 'Fall 2024');
INSERT INTO ENROLLMENT (GRADE_ID, SCHEDULE_ID, COURSE_NUM) VALUES (1001, 1, 'CS101');

-- Test execution: Execute the query being tested
WITH RelevantGrades AS (
    SELECT
        e.GRADE_ID
    FROM
        ENROLLMENT e
    JOIN
        COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID AND e.COURSE_NUM = cs.COURSE_NUM
    JOIN
        COURSE c ON cs.COURSE_NUM = c.COURSE_NUM
    WHERE
        c.COURSE_NAME = 'Introduction to Computer Science' AND
        cs.SEMESTER = 'Fall 2024'
)
INSERT INTO ASSIGNMENT (ASSIGNMENT_NUM, ASSIGNMENT_NAME, GRADE_ID)
SELECT
    1 AS ASSIGNMENT_NUM,
    'List Basics' AS ASSIGNMENT_NAME, 
    GRADE_ID
FROM
    RelevantGrades;

-- Test assertion: Check if the assignment was inserted correctly
SELECT COUNT(*) AS TotalAssignmentsInserted
FROM ASSIGNMENT
WHERE ASSIGNMENT_NAME = 'List Basics';
