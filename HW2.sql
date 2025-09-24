/* Cade Garcia
Assignment 2
Creating database, tables, and relationships*/

#===== Creating Database =====# 

CREATE DATABASE assignment2;


#===== Creating Tables =====#

	# Dorm Table #
CREATE TABLE dorm(
	dorName VARCHAR(30) NOT NULL PRIMARY KEY, -- PK dorName 
    dorPhone VARCHAR(20) NULL,
    dorAddress VARCHAR(50) NULL,
    dorCost INTEGER NOT NULL
);

	# Course Table #
CREATE TABLE course(
	crsID INTEGER NOT NULL PRIMARY KEY, -- PK crsName
    crsName VARCHAR(30) NOT NULL,
    crsCredit INTEGER NOT NULL,
	crsPreq VARCHAR(30) NOT NULL,
    crsCategory VARCHAR(30) NULL
);

	# Advisor Table #
CREATE TABLE Advisor(
	advID VARCHAR(30) NOT NULL PRIMARY KEY,
    advName VARCHAR(40) NOT NULL,
    advEmail VARCHAR(30) NOT NULL,
    advPhone VARCHAR(20) NULL,
    advAddress VARCHAR(50) NULL,
    advOffice VARCHAR(30) NULL
);

	# Department Table #
CREATE TABLE Department(
	dptID CHAR(3) NOT NULL PRIMARY KEY,
    dptName VARCHAR(20) NOT NULL,
    dptPhone VARCHAR(20) NOT NULL,
    advID VARCHAR(30) NOT NULL,
    FOREIGN KEY (advID) REFERENCES Advisor(advID)
);

	# Student Table #
CREATE TABLE student(
			stdID INTEGER NOT NULL PRIMARY KEY, -- PK stdID
			stdFirstName VARCHAR(30) NOT NULL,
            stdLastName VARCHAR(30) NOT NULL,
            stdAddress VARCHAR(50) NOT NULL,
            stdCity VARCHAR(30) NOT NULL,
            stdState CHAR(2) NOT NULL,
            stdZip INTEGER NOT NULL,
            stdEmail VARCHAR(50) NOT NULL,
			stdMajor VARCHAR(5) NULL,
            advID VARCHAR(30) NOT NULL,
			dorName VARCHAR(30) NOT NULL,
            dptID CHAR(3) NOT NULL,
            crsID INTEGER NOT NULL,
            FOREIGN KEY (advID) REFERENCES Advisor(advID),
            FOREIGN KEY (dorName) REFERENCES dorm(dorName),
            FOREIGN KEY (dptID) REFERENCES Department(dptID),
            FOREIGN KEY (crsID) REFERENCES course(crsID)
);

	# Linking Table #
CREATE TABLE linking(
			sclID INTEGER NOT NULL PRIMARY KEY,
			stdID INTEGER NOT NULL,
            crsID INTEGER NOT NULL,
            linCompleted VARCHAR (3) NULL,
            linGrades CHAR(1) NULL,
            linSemester VARCHAR(6) NOT NULL,
            linYear VARCHAR(4) NOT NULL,
            FOREIGN KEY (stdID) REFERENCES student(stdID),
            FOREIGN KEY (crsID) REFERENCES course(crsID)
);


/* I used "DROP TABLE ___" so I could switch the advisor and department tables after I realized the 
Advisor table had a foreign key that was in the table after it and the code wouldnt work*/