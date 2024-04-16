-- Insert values into COURSE table
INSERT INTO COURSE (COURSE_NUM, COURSE_NAME) VALUES
    (1, 'Mathematics'),
    (2, 'Physics'),
    (3, 'Biology');

-- Insert values into PROFESSOR table
INSERT INTO PROFESSOR (PROFESSOR_ID, F_NAME, L_NAME, DEPARTMENT_NAME) VALUES
    (1, 'John', 'Doe', 'Mathematics Department'),
    (2, 'Jane', 'Smith', 'Physics Department'),
    (3, 'Michael', 'Johnson', 'Biology Department');

-- Insert values into COURSE_SCHEDULE table
INSERT INTO COURSE_SCHEDULE (SCHEDULE_ID, COURSE_NUM, SEMESTER, PROFESSOR_ID) VALUES
    (1, 1, 'Spring 2024', 1),
    (2, 2, 'Fall 2024', 2),
    (3, 3, 'Spring 2025', 3);

-- Insert values into STUDENT table
INSERT INTO STUDENT (STUDENT_ID, F_NAME, L_NAME) VALUES
    (1, 'Alice', 'Smith'),
    (2, 'Bob', 'Johnson'),
    (3, 'Carol', 'Williams');

-- Insert values into ENROLLMENT table
INSERT INTO ENROLLMENT (ENROLLMENT_ID, STUDENT_ID, SCHEDULE_ID, COURSE_NUM) VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3);

-- Insert values into GRADE_DISTRIBUTION table
INSERT INTO GRADE_DISTRIBUTION (DISTRIBUTION_ID, COURSE_NUM, SCHEDULE_ID, NUM_HW, NUM_PROJ, PARTICIPATION_PERCENTAGE, HW_PERCENTAGE, NUM_TESTS, TESTS_PERCENTAGE) VALUES
    (1, 1, 1, 20, 30, 40, 30, 10, 30),
    (2, 2, 2, 15, 25, 35, 20, 10, 25);

-- Insert values into ASSIGNMENT table
INSERT INTO ASSIGNMENT (ASSIGNMENT_ID, ASSIGNMENT_NUM, GRADE) VALUES
    (1, 1, 90),
    (2, 2, 85);

-- Insert values into PROJECT table
INSERT INTO PROJECT (PROJECT_ID, PROJECT_NUM, GRADE) VALUES
    (1, 1, 95),
    (2, 2, 88);

-- Insert values into TEST table
INSERT INTO TEST (TEST_ID, TEST_NUM, GRADE) VALUES
    (1, 1, 80),
    (2, 2, 75);

-- Insert values into PARTICIPATION table
INSERT INTO PARTICIPATION (PARTICIPATION_ID, GRADE) VALUES
    (1, 100),
    (2, 95);
