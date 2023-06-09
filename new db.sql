-- CREATE DATABASE Grade_Manage CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Create Student table
CREATE TABLE Student (
  Stud_ID INT NOT NULL PRIMARY KEY,
  Stud_Name VARCHAR(50) NOT NULL,
  Stud_Birthday DATE,
  Stud_Gender VARCHAR(10),
  Stud_Address VARCHAR(100),
  Stud_Contact VARCHAR(50),
  Admission DATE NOT NULL,
  Graduation DATE,
  EnrollStatus ENUM('Enrolled', 'Suspended', 'Withdrawn', 'Graduated') NOT NULL,
  Major_Info VARCHAR(50)
);

-- Create Major table
CREATE TABLE Major (
  Major_ID INT NOT NULL PRIMARY KEY,
  Major_Name VARCHAR(50) NOT NULL,
  Required_Courses VARCHAR(100) NOT NULL,
  Required_Credits INT NOT NULL,
  Stud_ID INT NOT NULL,
  CONSTRAINT FK_Major_Student FOREIGN KEY (Stud_ID) REFERENCES Student (Stud_ID),
  CONSTRAINT UK_Major_Student_Major UNIQUE (Stud_ID, Major_ID)
);

-- Create Professor table
CREATE TABLE Professor (
  Prof_ID INT NOT NULL PRIMARY KEY,
  Prof_Name VARCHAR(50) NOT NULL,
  Prof_Gender VARCHAR(10),
  Prof_Contact VARCHAR(50) NOT NULL,
  Taught_Course VARCHAR(50) NOT NULL,
  Degree VARCHAR(50),
  Rank VARCHAR(50) NOT NULL,
  Lab_No VARCHAR(50) NOT NULL,
  Hiring_Date DATE NOT NULL
);

-- Create Course table
CREATE TABLE Course (
  Cour_ID INT NOT NULL PRIMARY KEY,
  Cour_Name VARCHAR(50) NOT NULL,
  Major_ID INT NOT NULL,
  Prof_ID INT NOT NULL,
  Cour_Quota INT NOT NULL,
  Cour_Semester VARCHAR(50) NOT NULL,
  Cour_Room VARCHAR(50) NOT NULL,
  Start_Time TIME NOT NULL,
  End_Time TIME NOT NULL,
  Textbook VARCHAR(100),
  CONSTRAINT FK_Course_Major FOREIGN KEY (Major_ID) REFERENCES Major (Major_ID),
  CONSTRAINT FK_Course_Professor FOREIGN KEY (Prof_ID) REFERENCES Professor (Prof_ID)
);

-- Create Grade table
CREATE TABLE Grade_Notice (
  Course_ID INT NOT NULL,
  Stud_ID INT NOT NULL,
  Cour_Grade VARCHAR(10) NOT NULL,
  Cour_Rank INT NOT NULL,
  Complete_Date DATE NOT NULL,
  PRIMARY KEY (Course_ID, Stud_ID),
  CONSTRAINT FK_Grade_Course FOREIGN KEY (Course_ID) REFERENCES Course (Cour_ID),
  CONSTRAINT FK_Grade_Student FOREIGN KEY (Stud_ID) REFERENCES Student (Stud_ID)
);
-- 

-- @@COMMIT;

ALTER TABLE Student
MODIFY COLUMN Stud_Gender ENUM('f', 'm');

-- COMMIT;

ALTER TABLE Student
MODIFY COLUMN EnrollStatus ENUM('0', '1', '2', '3') NOT NULL;

-- COMMIT;