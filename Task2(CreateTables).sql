-- Create table COURSE
CREATE TABLE COURSE (
    COURSE_NUM INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    DEPARTMENT_NAME VARCHAR(255)
);

-- Create table PROFESSOR
CREATE TABLE PROFESSOR (
    PROFESSOR_ID INT PRIMARY KEY,
    F_NAME VARCHAR(50),
    L_NAME VARCHAR(50),
    DEPARTMENT_NAME VARCHAR(255)
);

-- Create table STUDENT
CREATE TABLE STUDENT (
    STUDENT_ID INT PRIMARY KEY,
    F_NAME VARCHAR(50),
    L_NAME VARCHAR(50),
    DATE_OF_BIRTH DATE
);

-- Create table GRADE
CREATE TABLE GRADE (
    GRADE_ID INT PRIMARY KEY
);

-- Create table ASSIGNMENT
CREATE TABLE ASSIGNMENT (
    ASSIGNMENT_ID SERIAL PRIMARY KEY,
    ASSIGNMENT_NUM INT,
    ASSIGNMENT_NAME VARCHAR(255),
    GRADE_ID INT,
    GRADE INT,
    FOREIGN KEY (GRADE_ID) REFERENCES GRADE(GRADE_ID)
);

-- Create table PROJECT
CREATE TABLE PROJECT (
    PROJECT_ID INT PRIMARY KEY,
    PROJECT_NUM INT,
    PROJECT_NAME VARCHAR(255),
    GRADE_ID INT,
    GRADE INT,
    FOREIGN KEY (GRADE_ID) REFERENCES GRADE(GRADE_ID)
);

-- Create table TEST
CREATE TABLE TEST (
    TEST_ID INT PRIMARY KEY,
    TEST_NUM INT,
    TEST_NAME VARCHAR(255),
    GRADE_ID INT,
    GRADE INT,
    FOREIGN KEY (GRADE_ID) REFERENCES GRADE(GRADE_ID)
);

-- Create table PARTICIPATION
CREATE TABLE PARTICIPATION (
    PARTICIPATION_ID INT PRIMARY KEY,
    PARTICIPATION_TYPE VARCHAR(255),
    GRADE_ID INT,
    GRADE INT,
    FOREIGN KEY (GRADE_ID) REFERENCES GRADE(GRADE_ID)
);

CREATE TABLE COURSE_SCHEDULE (
    SCHEDULE_ID INT,
    COURSE_NUM INT,
    SEMESTER VARCHAR(50),
    PROFESSOR_ID INT,
    PRIMARY KEY (SCHEDULE_ID, COURSE_NUM),
    FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
    FOREIGN KEY (PROFESSOR_ID) REFERENCES PROFESSOR(PROFESSOR_ID)
);

-- Create table ENROLLMENT
CREATE TABLE ENROLLMENT (
    ENROLLMENT_ID INT PRIMARY KEY,
    STUDENT_ID INT,
    SCHEDULE_ID INT,
    COURSE_NUM INT,
    GRADE_ID INT,
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID),
    FOREIGN KEY (COURSE_NUM, SCHEDULE_ID) REFERENCES COURSE_SCHEDULE(COURSE_NUM, SCHEDULE_ID),
    FOREIGN KEY (GRADE_ID) REFERENCES GRADE(GRADE_ID)
);

-- Create table GRADE_DISTRIBUTION
CREATE TABLE GRADE_DISTRIBUTION (
    DISTRIBUTION_ID INT PRIMARY KEY,
    COURSE_NUM INT,
    SCHEDULE_ID INT,
    NUM_HW INT,
    NUM_PROJ INT,
    NUM_TESTS INT,
    PROJECT_PERCENTAGE INT,
    PARTICIPATION_PERCENTAGE INT,
    HW_PERCENTAGE INT,
    TESTS_PERCENTAGE INT,
    FOREIGN KEY (COURSE_NUM, SCHEDULE_ID) REFERENCES COURSE_SCHEDULE(COURSE_NUM, SCHEDULE_ID),
    CHECK (PROJECT_PERCENTAGE + PARTICIPATION_PERCENTAGE + HW_PERCENTAGE + TESTS_PERCENTAGE = 100)
);
