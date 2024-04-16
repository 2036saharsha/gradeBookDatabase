-- Insert data into COURSE
INSERT INTO COURSE (COURSE_NUM, COURSE_NAME) VALUES
(101, 'Introduction to Computer Science'),
(102, 'Database Systems'),
(103, 'Operating Systems'),
(104, 'Software Engineering'),
(105, 'Algorithms'),
(106, 'Machine Learning'),
(107, 'Computer Networks'),
(108, 'Web Development'),
(109, 'Data Science'),
(110, 'Artificial Intelligence');

-- Insert data into PROFESSOR
INSERT INTO PROFESSOR (PROFESSOR_ID, F_NAME, L_NAME, DEPARTMENT_NAME) VALUES
(201, 'Alice', 'Smith', 'Computer Science'),
(202, 'Bob', 'Johnson', 'Computer Science'),
(203, 'Carol', 'Williams', 'Computer Science'),
(204, 'Dave', 'Jones', 'Computer Science'),
(205, 'Eve', 'Brown', 'Computer Science'),
(206, 'Frank', 'Davis', 'Computer Science'),
(207, 'Grace', 'Miller', 'Computer Science'),
(208, 'Hank', 'Wilson', 'Computer Science'),
(209, 'Isaac', 'Moore', 'Computer Science'),
(210, 'Judy', 'Taylor', 'Computer Science');

-- Insert data into COURSE_SCHEDULE
INSERT INTO COURSE_SCHEDULE (SCHEDULE_ID, COURSE_NUM, SEMESTER, PROFESSOR_ID) VALUES
(301, 101, 'Fall 2024', 201),
(302, 102, 'Fall 2024', 202),
(303, 103, 'Fall 2024', 203),
(304, 104, 'Fall 2024', 204),
(305, 105, 'Fall 2024', 205),
(306, 106, 'Fall 2024', 206),
(307, 107, 'Fall 2024', 207),
(308, 108, 'Fall 2024', 208),
(309, 109, 'Fall 2024', 209),
(310, 110, 'Fall 2024', 210);

-- Insert data into STUDENT
INSERT INTO STUDENT (STUDENT_ID, F_NAME, L_NAME) VALUES
(401, 'Laura', 'Adams'),
(402, 'Mike', 'Clark'),
(403, 'Nancy', 'Evans'),
(404, 'Oliver', 'Hill'),
(405, 'Patricia', 'King'),
(406, 'Quincy', 'Lee'),
(407, 'Rachel', 'Morgan'),
(408, 'Steve', 'Nelson'),
(409, 'Tina', 'Owens'),
(410, 'Uma', 'Perry');

-- Insert data into ENROLLMENT
INSERT INTO ENROLLMENT (ENROLLMENT_ID, STUDENT_ID, SCHEDULE_ID, COURSE_NUM) VALUES
(501, 401, 301, 101),
(502, 402, 302, 102),
(503, 403, 303, 103),
(504, 404, 304, 104),
(505, 405, 305, 105),
(506, 406, 306, 106),
(507, 407, 307, 107),
(508, 408, 308, 108),
(509, 409, 309, 109),
(510, 410, 310, 110);

-- Insert data into GRADE_DISTRIBUTION
INSERT INTO GRADE_DISTRIBUTION (DISTRIBUTION_ID, COURSE_NUM, SCHEDULE_ID, NUM_HW, NUM_PROJ, NUM_TESTS, PROJECT_PERCENTAGE, PARTICIPATION_PERCENTAGE, HW_PERCENTAGE, TESTS_PERCENTAGE) VALUES
(601, 101, 301, 10, 1, 2, 30, 10, 30, 30),
(602, 102, 302, 8, 2, 3, 25, 15, 30, 30),
(603, 103, 303, 7, 2, 2, 30, 20, 25, 25),
(604, 104, 304, 5, 3, 3, 35, 10, 25, 30),
(605, 105, 305, 6, 2, 2, 30, 10, 30, 30),
(606, 106, 306, 9, 1, 2, 30, 5, 35, 30),
(607, 107, 307, 8, 1, 3, 30, 15, 25, 30),
(608, 108, 308, 10, 2, 2, 30, 10, 30, 30),
(609, 109, 309, 7, 2, 3, 35, 15, 20, 30),
(610, 110, 310, 5, 3, 3, 35, 5, 30, 30);

-- Insert data into ASSIGNMENT
INSERT INTO ASSIGNMENT (ASSIGNMENT_ID, ASSIGNMENT_NUM, ASSIGNMENT_NAME, GRADE) VALUES
(701, 1, 'Introduction to Programming', 85),
(702, 2, 'Data Structures', 90),
(703, 3, 'Algorithms Analysis', 75),
(704, 4, 'Operating Systems Concepts', 80),
(705, 5, 'Database Design', 95);

-- Insert data into PROJECT
INSERT INTO PROJECT (PROJECT_ID, PROJECT_NUM, PROJECT_NAME, GRADE) VALUES
(801, 1, 'Database Implementation', 88),
(802, 2, 'Machine Learning Model', 85),
(803, 3, 'Network Simulation', 90),
(804, 4, 'Web Application Development', 93),
(805, 5, 'Artificial Intelligence Project', 87);

-- Insert data into TEST
INSERT INTO TEST (TEST_ID, TEST_NUM, TEST_NAME, GRADE) VALUES
(901, 1, 'Midterm Exam 1', 75),
(902, 2, 'Final Exam', 80),
(903, 3, 'Pop Quiz', 85),
(904, 4, 'Lab Exam', 78),
(905, 5, 'Project Defense', 82);

-- Insert data into PARTICIPATION
INSERT INTO PARTICIPATION (PARTICIPATION_ID, PARTICIPATION_TYPE, GRADE) VALUES
(1001, 'Class Participation', 95),
(1002, 'Online Discussion', 90),
(1003, 'Group Work', 88),
(1004, 'Seminar Presentation', 92),
(1005, 'Workshop Attendance', 89);

-- Insert data into GRADE
INSERT INTO GRADE (GRADE_ID, ASSIGNMENT_ID, PROJECT_ID, TEST_ID, PARTICIPATION_ID) VALUES
(1101, 701, 801, 901, 1001),
(1102, 702, 802, 902, 1002),
(1103, 703, 803, 903, 1003),
(1104, 704, 804, 904, 1004),
(1105, 705, 805, 905, 1005);