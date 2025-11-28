USE iths_database;
CREATE TABLE person(
                       person_id INT AUTO_INCREMENT,
                       first_name VARCHAR(20) NOT NULL,
                       last_name VARCHAR(20) NOT NULL,
                       dob DATE,
                       income DOUBLE,
                       PRIMARY KEY (person_id)
);

INSERT INTO person (first_name, last_name,dob, income)
VALUES
    ('Anna', 'Karlsson', '1990-05-12', 45000.00),
    ('Erik', 'Johansson', '1985-11-03', 52000.50),
    ('Maria', 'Svensson', '1992-07-21', 38000.75),
    ('Johan', 'Lindberg', '1978-02-14', 61000.00),
    ('Sara', 'Nilsson', '2000-09-30', 29500.00),
    ('Peter', 'Andersson', '1988-12-05', 47000.25),
    ('Emma', 'Bergström', '1995-03-18', 41000.00),
    ('Daniel', 'Olsson', '1982-06-27', 68000.00),
    ('Karin', 'Lundqvist', '1998-01-09', 33000.00),
    ('Lars', 'Holm', '1975-08-22', 75000.00);

/* SELECT som hämtar alla kolumner och rader från tabellen. */

SELECT * FROM person;

/* UPDATE som ändrar minst ett värde i en av raderna. */

UPDATE person
SET first_name = 'Mike', last_name ='Jordan'
WHERE person_id = 2;

/*  DELETE som tar5 bort minst en rad.*/
DELETE FROM person
WHERE person_id IN (3,7);

/* Del 6 -Normalisering -1NF */
USE iths_database;

CREATE TABLE student_1NF (
                             StudentID INT PRIMARY KEY ,
                             Name VARCHAR(50)
);

INSERT INTO student_1NF (StudentID,Name)
VALUES
    (10,'Maja'),
    (11,'Elias'),
    (12,'Sara'),
    (13,'Omar');

CREATE TABLE Phone_1NF (
                           PhoneID INT AUTO_INCREMENT,
                           StudentID INT,
                           PhoneNumber VARCHAR(20),
                           PRIMARY KEY ( PhoneID ),
                           FOREIGN KEY (StudentID) REFERENCES student_1NF(StudentID)
);

INSERT INTO Phone_1NF (StudentID,PhoneNumber)
VALUES
    (10,'070-1234567'),
    (10,'073-5556677'),
    (11,'070-8881122'),
    (12,'072-9911223'),
    (12,'072-9911224'),
    (13,'076-3344556');

/* CREATE TABLE  och FOREIGN KEY*/
CREATE TABLE Course (
                        StudentID INT PRIMARY KEY,
                        CourseName VARCHAR(50),
                        FOREIGN KEY (StudentID) REFERENCES student_1NF(StudentID)
);

INSERT INTO Course (StudentID,CourseName)
VALUES
    (10, 'Java'),
    (11, 'JaVa'),
    (12, 'JavaScript'),
    (13, 'JavaScript');


/* LEFT JOIN*/
SELECT Name,CourseName FROM student_1NF
                                LEFT JOIN Course
                                          ON student_1NF.StudentID = Course.StudentID;