-- Test case to verify insertion of sample data

-- Check if sample data is inserted properly into the COURSE table
SELECT * FROM COURSE WHERE COURSE_NUM IN (101, 102, 103);

-- Check if sample data is inserted properly into the PROFESSOR table
SELECT * FROM PROFESSOR WHERE PROFESSOR_ID IN (1, 2);

-- Check if sample data is inserted properly into the STUDENT table
SELECT * FROM STUDENT WHERE STUDENT_ID IN (201, 202);

-- Check if sample data is inserted properly into the GRADE table
SELECT * FROM GRADE WHERE GRADE_ID IN (1, 2, 3, 4);

-- Check if sample data is inserted properly into the ASSIGNMENT table
SELECT * FROM ASSIGNMENT WHERE ASSIGNMENT_NUM IN (1, 2);

-- Check if sample data is inserted properly into the PROJECT table
SELECT * FROM PROJECT WHERE PROJECT_NUM = 1;

-- Check if sample data is inserted properly into the TEST table
SELECT * FROM TEST WHERE TEST_NUM = 1;

-- Check if sample data is inserted properly into the PARTICIPATION table
SELECT * FROM PARTICIPATION WHERE PARTICIPATION_ID = 1;

-- Check if sample data is inserted properly into the COURSE_SCHEDULE table
SELECT * FROM COURSE_SCHEDULE WHERE SCHEDULE_ID IN (1, 2, 3);

-- Check if sample data is inserted properly into the ENROLLMENT table
SELECT * FROM ENROLLMENT WHERE ENROLLMENT_ID IN (1, 2, 3, 4);

-- Check if sample data is inserted properly into the GRADE_DISTRIBUTION table
SELECT * FROM GRADE_DISTRIBUTION WHERE DISTRIBUTION_ID = 1;
