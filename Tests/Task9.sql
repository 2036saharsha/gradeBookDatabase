-- Test: Add 2 points to all grades for 'Homework 2'
UPDATE ASSIGNMENT SET GRADE = GRADE + 2 WHERE ASSIGNMENT_NAME = 'Homework 2';
-- Verify the update
SELECT * FROM ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2';
