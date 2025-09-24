#comment does not end
-- comment does not end
-- something something blah balh blah
# comment2a with space
#comment2b without space

# comment 2c comment2d 
/* comment */ 
/** comment 
line 2 
line 3 
*/

/***** create our database *****/
CREATE DATABASE cs200_dbpractice;
CREATE TABLE student(
			stdID INTEGER NOT NULL,
			stdFirstName VARCHAR(30) NOT NULL,
            stdLastName VARCHAR(30) NOT NULL,
            stdAddress VARCHAR(50) NOT NULL,
            stdCity VARCHAR(30) NOT NULL,
            stdState CHAR(2) NOT NULL,
            stdZip INTEGER NOT NULL,
            stdEmail VARCHAR(50) NOT NULL,
            stdMajxxx VARCHAR(5) NULL,
            advID VARCHAR(5) NOT NULL,
            dropColumn VARCHAR(255) NOT NULL
);
            