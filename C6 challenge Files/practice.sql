show tables;
CREATE TABLE student1 (
  name VARCHAR(255),
  value INT
);
CREATE TABLE student2 (
  name VARCHAR(255),
  value INT
);

 CREATE TABLE student3 (
  name VARCHAR(255),
  value INT
);

INSERT INTO student2 (name, value)
VALUES ('yes', 10),
       ('key', 11),
       ('hie', 13),
       ('why', 15),
       ('ok', 16);
select * from student2;
select * from student1;
CREATE TABLE dates (
  date_value DATE,
  dates_col varchar(89)
);

INSERT INTO student3 (name, value)
VALUES ('yes', 10),
       ('you', 11),
       ('hie', 13),
       ('why', 15),
       ('ok', 16);
       
       
INSERT INTO dates (date_value, dates_col)
VALUES ('2023-01-01', 'First Date'),
       ('2023-02-15', '12-07-1997'),
       ('2023-07-06', 'Current Date');
select s1.name from student1 s1
    join student2 s2 on s1.value=s2.value;
