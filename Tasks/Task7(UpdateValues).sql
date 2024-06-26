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
