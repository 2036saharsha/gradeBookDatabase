-- Insert sample data into COURSE
INSERT INTO COURSE (COURSE_NUM, COURSE_NAME, DEPARTMENT_NAME) VALUES
(101, 'Introduction to Computer Science', 'Computer Science'),
(102, 'Advanced Database Systems', 'Computer Science'),
(103, 'Linear Algebra', 'Mathematics');

-- Insert sample data into PROFESSOR
INSERT INTO PROFESSOR (PROFESSOR_ID, F_NAME, L_NAME, DEPARTMENT_NAME) VALUES
(1, 'John', 'Doe', 'Computer Science'),
(2, 'Jane', 'Smith', 'Mathematics');

-- Insert sample data into STUDENT
INSERT INTO STUDENT (STUDENT_ID, F_NAME, L_NAME, DATE_OF_BIRTH) VALUES
(201, 'Alice', 'Johnson', '2001-05-14'),
(202, 'Bob', 'Lee', '2002-11-24');

-- Insert sample data into GRADE (assuming GRADE_ID auto-increments, no direct inserts here if that's the case)
INSERT INTO GRADE (GRADE_ID) VALUES
(1),
(2),
(3),
(4);

-- Insert sample data into ASSIGNMENT
INSERT INTO ASSIGNMENT (ASSIGNMENT_NUM, ASSIGNMENT_NAME, GRADE_ID, GRADE) VALUES
(1, 'Homework 1', 1, 85),
(2, 'Homework 2', 2, 90);

-- Insert sample data into PROJECT
INSERT INTO PROJECT (PROJECT_ID, PROJECT_NUM, PROJECT_NAME, GRADE_ID, GRADE) VALUES
(1, 1, 'Database Project', 3, 92);

-- Insert sample data into TEST
INSERT INTO TEST (TEST_ID, TEST_NUM, TEST_NAME, GRADE_ID, GRADE) VALUES
(1, 1, 'Midterm Exam', 4, 88);

-- Insert sample data into PARTICIPATION
INSERT INTO PARTICIPATION (PARTICIPATION_ID, PARTICIPATION_TYPE, GRADE_ID, GRADE) VALUES
(1, 'Class Participation', 1, 95);

-- Insert sample data into COURSE_SCHEDULE
INSERT INTO COURSE_SCHEDULE (SCHEDULE_ID, COURSE_NUM, SEMESTER, PROFESSOR_ID) VALUES
(1, 101, 'Fall 2024', 1),
(2, 102, 'Spring 2025', 1),
(3, 103, 'Fall 2024', 2);

-- Insert sample data into ENROLLMENT
INSERT INTO ENROLLMENT (ENROLLMENT_ID, STUDENT_ID, SCHEDULE_ID, COURSE_NUM, GRADE_ID) VALUES
(1, 201, 1, 101, 1),
(2, 202, 2, 102, 2),
(3, 201, 3, 103, 3),
(4, 202, 1, 101, 4);

-- Insert sample data into GRADE_DISTRIBUTION
INSERT INTO GRADE_DISTRIBUTION (DISTRIBUTION_ID, COURSE_NUM, SCHEDULE_ID, NUM_HW, NUM_PROJ, NUM_TESTS, PROJECT_PERCENTAGE, PARTICIPATION_PERCENTAGE, HW_PERCENTAGE, TESTS_PERCENTAGE) VALUES
(1, 101, 1, 5, 1, 2, 30, 10, 40, 20);
