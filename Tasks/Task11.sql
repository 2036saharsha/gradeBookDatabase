WITH 
AssignmentSum AS (
    SELECT
        e.STUDENT_ID,
        SUM(COALESCE(a.GRADE, 0.0)) AS ASSIGNMENT_SUM
    FROM
        ENROLLMENT e
        LEFT JOIN ASSIGNMENT a ON e.GRADE_ID = a.GRADE_ID
        JOIN COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID
        JOIN COURSE c ON cs.COURSE_NUM = c.COURSE_NUM
    WHERE
        e.STUDENT_ID = 201
        AND c.COURSE_NAME = 'Introduction to Computer Science'
        AND cs.SEMESTER = 'Fall 2024'
    GROUP BY
        e.STUDENT_ID
),

ProjectSum AS (
    SELECT
        e.STUDENT_ID,
        SUM(COALESCE(p.GRADE, 0.0)) AS PROJECT_SUM
    FROM
        ENROLLMENT e
        LEFT JOIN PROJECT p ON e.GRADE_ID = p.GRADE_ID
        JOIN COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID
        JOIN COURSE c ON cs.COURSE_NUM = c.COURSE_NUM
    WHERE
        e.STUDENT_ID = 201
        AND c.COURSE_NAME = 'Introduction to Computer Science'
        AND cs.SEMESTER = 'Fall 2024'
    GROUP BY
        e.STUDENT_ID
),

TestSum AS (
    SELECT
        e.STUDENT_ID,
        SUM(COALESCE(t.GRADE, 0.0)) AS TEST_SUM
    FROM
        ENROLLMENT e
        LEFT JOIN TEST t ON e.GRADE_ID = t.GRADE_ID
        JOIN COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID
        JOIN COURSE c ON cs.COURSE_NUM = c.COURSE_NUM
    WHERE
        e.STUDENT_ID = 201
        AND c.COURSE_NAME = 'Introduction to Computer Science'
        AND cs.SEMESTER = 'Fall 2024'
    GROUP BY
        e.STUDENT_ID
),

ParticipationSum AS (
    SELECT
        e.STUDENT_ID,
        SUM(COALESCE(pt.GRADE, 0.0)) AS PARTICIPATION_SUM
    FROM
        ENROLLMENT e
        LEFT JOIN PARTICIPATION pt ON e.GRADE_ID = pt.GRADE_ID
        JOIN COURSE_SCHEDULE cs ON e.SCHEDULE_ID = cs.SCHEDULE_ID
        JOIN COURSE c ON cs.COURSE_NUM = c.COURSE_NUM
    WHERE
        e.STUDENT_ID = 201
        AND c.COURSE_NAME = 'Introduction to Computer Science'
        AND cs.SEMESTER = 'Fall 2024'
    GROUP BY
        e.STUDENT_ID
),

CombinedSums AS (
    SELECT
        COALESCE(AssignmentSum.STUDENT_ID, ProjectSum.STUDENT_ID, TestSum.STUDENT_ID, ParticipationSum.STUDENT_ID) AS STUDENT_ID,
        COALESCE(AssignmentSum.ASSIGNMENT_SUM, 0.0) AS ASSIGNMENT_SUM,
        COALESCE(ProjectSum.PROJECT_SUM, 0.0) AS PROJECT_SUM,
        COALESCE(TestSum.TEST_SUM, 0.0) AS TEST_SUM,
        COALESCE(ParticipationSum.PARTICIPATION_SUM, 0.0) AS PARTICIPATION_SUM
    FROM
        AssignmentSum
        FULL OUTER JOIN ProjectSum ON AssignmentSum.STUDENT_ID = ProjectSum.STUDENT_ID
        FULL OUTER JOIN TestSum ON ProjectSum.STUDENT_ID = TestSum.STUDENT_ID
        FULL OUTER JOIN ParticipationSum ON TestSum.STUDENT_ID = ParticipationSum.STUDENT_ID
),

FinalGrades AS (
    SELECT
        CombinedSums.STUDENT_ID,
        (PROJECT_SUM / (g.NUM_PROJ * 100.0) * g.PROJECT_PERCENTAGE +
        ASSIGNMENT_SUM / (g.NUM_HW * 100.0) * g.HW_PERCENTAGE +
        TEST_SUM / (g.NUM_TESTS * 100.0) * g.TESTS_PERCENTAGE +
        PARTICIPATION_SUM / 100.0 * g.PARTICIPATION_PERCENTAGE) AS TOTAL_GRADE
    FROM
        CombinedSums
        JOIN COURSE_SCHEDULE cs ON cs.SEMESTER = 'Fall 2024' AND cs.COURSE_NUM = (SELECT COURSE_NUM FROM COURSE WHERE COURSE_NAME = 'Introduction to Computer Science')
        JOIN GRADE_DISTRIBUTION g ON g.COURSE_NUM = cs.COURSE_NUM AND g.SCHEDULE_ID = cs.SCHEDULE_ID
)

SELECT * FROM FinalGrades;
