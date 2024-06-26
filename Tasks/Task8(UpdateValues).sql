UPDATE GRADE_DISTRIBUTION
SET
    HW_PERCENTAGE = 20,
    PROJECT_PERCENTAGE = 40,
    TESTS_PERCENTAGE = 30,
    PARTICIPATION_PERCENTAGE = 10
FROM
    COURSE_SCHEDULE
    JOIN COURSE ON COURSE_SCHEDULE.COURSE_NUM = COURSE.COURSE_NUM
WHERE
    COURSE_SCHEDULE.COURSE_NUM = GRADE_DISTRIBUTION.COURSE_NUM AND
    COURSE_SCHEDULE.SCHEDULE_ID = GRADE_DISTRIBUTION.SCHEDULE_ID AND
    COURSE.COURSE_NAME = 'Introduction to Computer Science' AND
    COURSE_SCHEDULE.SEMESTER = 'Fall 2024';
