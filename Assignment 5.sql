/*****CREATE DATABASE*****/
CREATE DATABASE assignment5;
/*****CREATING TABLES*****/
/*–––Dorm Table–––*/

CREATE TABLE dorm(
dorName VARCHAR(30) NOT NULL PRIMARY KEY, #PK dorName
dorPhone VARCHAR(20) NULL,
dorAddress VARCHAR(50) NULL,
dorCost INTEGER(10) NULL
);

/*–––Advisor Table–––*/
CREATE TABLE advisor(
advID INTEGER NOT NULL PRIMARY KEY, #PK, advID
advFirstName VARCHAR (30) NOT NULL,
advLastName VARCHAR (30) NOT NULL,
advPhone VARCHAR(20) NOT NULL
);

/*–––Department Table–––*/
CREATE TABLE department(
depID VARCHAR(20) NOT NULL PRIMARY KEY, #PK depID
depName VARCHAR (30) NOT NULL,
depPhone VARCHAR(20) NOT NULL,
advID INTEGER NOT NULL, #FK advID
FOREIGN KEY (advID) REFERENCES advisor(advID)
);

/*–––Course Table–––*/
CREATE TABLE course(
crsID VARCHAR(30) NOT NULL PRIMARY KEY, #PK crsID
crsName VARCHAR(50) NULL,
crsCredit INTEGER NULL,
crsPreq VARCHAR(30) NULL,
crsCategory VARCHAR(30) NULL,
depID VARCHAR(20) NOT NULL,
FOREIGN KEY (depID) REFERENCES department(depID)
);

/*–––Student Table–––*/
CREATE TABLE student(
stdID INTEGER NOT NULL PRIMARY KEY, #PK stdID
stdFirstName VARCHAR(30) NOT NULL,
stdLastName VARCHAR(30) NOT NULL,
stdAddress VARCHAR(50) NOT NULL,
stdCity VARCHAR(30) NOT NULL,
stdState CHAR(2) NOT NULL,
stdZip INTEGER NOT NULL,
stdEmail VARCHAR(50) NOT NULL,
stdMajor VARCHAR(5) NULL,
advID INTEGER NOT NULL, #FK advID
dorName VARCHAR(30) NULL, #FK dorName
depID VARCHAR(20) NULL, #FK depID
FOREIGN KEY (advID) REFERENCES advisor(advID),
FOREIGN KEY (dorName) REFERENCES dorm(dorName),
FOREIGN KEY (depID) REFERENCES department(depID)
);

/*–––Linking table for students and courses–––*/
CREATE TABLE student_course_linking(
stdID INTEGER NOT NULL, #FK stdID
crsID VARCHAR(30) NOT NULL, #FK crsID
linComplete VARCHAR(3) NULL,
linGrades CHAR(1) NULL,
linSemester VARCHAR(6) NOT NULL,
linYear VARCHAR(4) NOT NULL,
FOREIGN KEY (stdID) REFERENCES student(stdID),
FOREIGN KEY (crsID) REFERENCES course(crsID)
);

/*****INSERTING DATA INTO TABLES*****/
/*–––Dorm Data–––*/
INSERT INTO dorm (dorName, dorPhone, dorAddress, dorCost)
VALUES ('Lokelani', '735-4709', '3140 Waialae Ave', '1100'),
('Kieffer', '735-5802', '3140 Waialae Ave',
'500'),
('none', null, null, null);

SELECT * FROM dorm;
/*–––Advisor Data–––*/
INSERT INTO advisor (advID, advFirstName, advLastName, advPhone)
VALUES (11, 'Rylan', 'Chong', '739-4601'),
(12, 'Robert', 'Maruyama', '749-4605'),
(13, 'Laura', 'Tipton', '739-4123'),
(14, 'Mark', 'Speck', '739-4444'),
(00, 'unknown', 'unknown', 'unknown');

/*–––Department Data–––*/
INSERT INTO department (depID, depName, depPhone, advID)
VALUES ('ENV', 'Environment', '437-2222', 11),
('CIS', 'Computer Information Systems', '437-5555', 12),
('BU', 'Business', '437-3333', 00);

/*–––Course Data–––*/
INSERT INTO course (crsID, crsName, crsCredit, crsPreq, crsCategory,
depID)
VALUES ('ENV100', 'Intro to Expository Writing', '3', 'None', 'Pre-Major',
'ENV'),
('ENV102', 'Expository Writing', '3', 'None',
'Pre-Major', 'ENV'),
('ENV310', 'Types of Literature', '3', 'EN102', 'Major',
'ENV'),
('BU200', 'Intro to Business', '3', 'None', 'Pre-Major',
'CIS'),
('CIS100', 'Computers and Applications Software', '3', 'None',
'Pre-Major', 'CIS'),
('CIS400', 'Database design and management', '3', 'CIS100',
'Major', 'CIS');

/*–––Student Data–––*/
INSERT INTO student (stdID, stdFirstName, stdLastName, stdAddress,
stdCity, stdState, stdZip, stdEmail, stdMajor, advID, dorName, depID)
VALUES (1, 'Bob', 'Furuhashi', '3140 Waialae Ave', 'Honolulu', 'HI',
'96816', 'kshigiji@gmail.com', 'ENV', '11', 'Lokelani', 'ENV'),
(2, 'Alice', 'Grey', '1610 Boiler Rd', 'West
Lafayette', 'IN', '47906', 'alice.grey@student.chaminade.edu', 'CIS',
'12', 'Lokelani', 'CIS'),
(3, 'Christian', 'Phillips', '987 6th Ave', 'Honolulu', 'HI',
'96816', 'cphillips@student.chaminade.edu', 'CIS', '12', 'Lokelani',
'CIS'),
(4, 'Jeff', 'Bedora', '3046-B Harding Ave', 'Honolulu', 'HI',
'96816', 'coolcatman2001@yahoo.com', 'CIS', '12', 'none', 'CIS'),
(5, 'Hannah', 'Brown', '3140 Waialae Ave', 'Honolulu', 'HI',
'96816', 'hannah.brown@student.chaminade.edu', 'ENV', '11', 'Lokelani',
'ENV'),
(6, 'Rena', 'Phillips', '987 6th Ave', 'Honolulu', 'HI',
'96816', 'rena.phillips@student.chaminade.edu', 'ENV', '11', 'Lokelani',
'ENV'),
(7, 'Cathleen', 'Akemi', '3140 Waialae Ave', 'Honolulu', 'HI',
'96816', 'cathleen.akemi@student.chaminade.edu', 'ENV', '11', 'Kieffer',
'ENV'),
(8, 'Anthony', 'Davis', '3140 Waialae Ave', 'Honolulu', 'HI',
'96816', 'anthony.davis@student.chaminade.edu', 'CIS', '12', 'Kieffer',
'CIS'),
(9, 'Lori', 'Maumalanga', '3140 Waialae Ave', 'Honolulu',
'HI', '96816', 'lori.maumalanga@student.chaminade.edu', 'CIS', '12',
'Lokelani', 'CIS'),
(10, 'Becks', 'Holden', '123 Apple St', 'Aiea', 'HI', '96701',
'beck123@outlook.com', 'CIS', '12', 'Lokelani', 'CIS');

/*–––Student_Course_Linking Data–––*/
INSERT INTO student_course_linking (stdID, crsID, linComplete, linGrades,
linSemester, linYear)
VALUES (1, 'ENV100', 'YES', 'A', 'Fall', '2009'),
(1, 'ENV102', 'YES', 'C', 'Spring', '2010'),
(1, 'ENV310', 'NO', null, 'Fall', '2010'),
(2, 'BU200', 'YES', 'A', 'Spring', '2009'),
(2, 'CIS100', 'YES', 'A', 'Spring', '2009'),
(2, 'CIS400', 'YES', 'B', 'Fall', '2009');

	# INNER JOIN #
SELECT * 
FROM student, dorm -- automatically inner joins
WHERE student.dorName = dorm.dorName;

SELECT *
FROM student INNER JOIN dorm -- inner join
ON student.dorName=dorm.dorName;

SELECT *
FROM student INNER JOIN student_course_linking -- order matters!!!
ON student.stdID = student_course_linking.stdID;

SELECT *
FROM student_course_linking INNER JOIN student
ON student_course_linking.stdID = student.stdID;

	# LEFT JOIN #
SELECT *
FROM student LEFT JOIN dorm -- student table + similar ones from dorm table
ON student.dorName = dorm.dorName;

SELECT *
FROM dorm LEFT JOIN student
ON student.dorName= dorm.dorName; -- as long as there is linkage, it doesn't matter how you flip this line.

SELECT *
FROM student_course_linking LEFT JOIN student
ON student.stdID = student_course_linking.stdID
ORDER BY student.stdID;

	# RIGHT JOIN #
SELECT *
FROM student RIGHT JOIN student_course_linking
ON student.stdID = student_course_linking.stdID
ORDER BY student.stdID;

	#=====# 3 Tables #=====#
SELECT *
FROM student_course_linking INNER JOIN student
ON student_course_linking.stdID = student.stdID
	INNER JOIN course -- can add this because code above already had course ID 
    ON course.crsID = student_course_linking.crsID;
    

SELECT *
FROM student INNER JOIN course
	INNER JOIN student_course_linking
	ON course.crsID = student_course_linking.crsID
ON student.stdID = student_course_linking.stdID;

SELECT student.stdFirstName, student.stdLastName, course.crsID, student_course_linking.linGrades
FROM student INNER JOIN student_course_linking
	INNER JOIN course
    ON course.crsID = student_course_linking.crsID
ON student_course_linking.stdID = student.stdID
WHERE student.stdLastName = 'Grey';

SELECT *
FROM course INNER JOIN student_course_linking
	INNER JOIN student
    INNER JOIN advisor
    ON student.advID = advisor.advID
    ON student_course_linking.stdID = student.stdID
	ON course.crsID = student_course_linking.crsID;
    
#=====# Subquery #=====#

	# Single Table
SELECT advFirstName, advLastName
FROM advisor;

SELECT stdID, stdFirstName
FROM student
WHERE advID IN (12);

	# Subquery
SELECT stdID, stdFirstName
FROM student
WHERE advID=(SELECT advID
				FROM advisor
                WHERE advLastName = 'Maruyama');
                
SELECT stdID, stdFirstName
FROM student 
WHERE stdID = (SELECT stdID 
			FROM student_course_linking
            WHERE crsID = 'CIS400' AND linComplete = 'yes');
            
SELECT stdID, stdFirstName
FROM student
WHERE dorName IN (SELECT dorName
					FROM dorm
                    WHERE dorName IN ('Lokelani', 'Kieffer'))
ORDER BY stdID;

-- which students are not taking Intro to Business
SELECT stdID, stdFirstName
FROM student
WHERE stdID != (SELECT stdID -- !- is the same as NOT IN 
					FROM student_course_linking
                    WHERE crsID IN (SELECT crsID
									FROM course
                                    WHERE crsName = 'Intro to Business'));