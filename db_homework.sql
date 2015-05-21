DROP TABLE users;
DROP TABLE comments;
DROP TABLE jan;
CREATE TABLE users
  (
  users_id     CHAR(3)     NOT NULL,
  users_name   VARCHAR(15) NOT NULL,
  users_gender VARCHAR(15) NOT NULL,
  users_state  VARCHAR(20) NOT NULL,
  CONSTRAINT pk_user PRIMARY KEY (users_id)
  );

CREATE TABLE comments
  (
  comment_id       CHAR(3)     NOT NULL,
  com_date		   DATE        NOT NULL,
  com_day		   INT(2)      NOT NULL,
  com_timestamp    TIMESTAMP   NOT NULL,
  comment		   VARCHAR(40) NOT NULL,
  CONSTRAINT pk_timestamp PRIMARY KEY (com_timestamp)
  );

CREATE TABLE jan
(
  jan_day	    int(2)        NOT NULL,
  jan_date	    DATE          NOT NULL,
  CONSTRAINT pk_day PRIMARY KEY (jan_date)
  );
  
INSERT INTO jan VALUES('01','2012-01-01');
INSERT INTO jan VALUES('02','2012-01-02');
INSERT INTO jan VALUES('03','2012-01-03');
INSERT INTO jan VALUES('04','2012-01-04');
INSERT INTO jan VALUES('05','2012-01-05');
INSERT INTO jan VALUES('06','2012-01-06');
INSERT INTO jan VALUES('07','2012-01-07');
INSERT INTO jan VALUES('08','2012-01-08');
INSERT INTO jan VALUES('09','2012-01-09');
INSERT INTO jan VALUES('10','2012-01-10');
INSERT INTO jan VALUES('11','2012-01-11');
INSERT INTO jan VALUES('12','2012-01-12');
INSERT INTO jan VALUES('13','2012-01-13');
INSERT INTO jan VALUES('14','2012-01-14');
INSERT INTO jan VALUES('15','2012-01-15');
INSERT INTO jan VALUES('16','2012-01-16');
INSERT INTO jan VALUES('17','2012-01-17');
INSERT INTO jan VALUES('18','2012-01-18');
INSERT INTO jan VALUES('19','2012-01-19');
INSERT INTO jan VALUES('20','2012-01-20');
INSERT INTO jan VALUES('21','2012-01-21');
INSERT INTO jan VALUES('22','2012-01-22');
INSERT INTO jan VALUES('23','2012-01-23');
INSERT INTO jan VALUES('24','2012-01-24');
INSERT INTO jan VALUES('25','2012-01-25');
INSERT INTO jan VALUES('26','2012-01-26');
INSERT INTO jan VALUES('27','2012-01-27');
INSERT INTO jan VALUES('28','2012-01-28');
INSERT INTO jan VALUES('29','2012-01-29');
INSERT INTO jan VALUES('30','2012-01-30');
INSERT INTO jan VALUES('31','2012-01-31');
  

INSERT INTO users VALUES('1','Cody','Male','WI');
INSERT INTO users VALUES('2','Chris','Male','CA');

INSERT INTO comments VALUES('1','2012-01-02','02','2012-01-02 08:31:03.8','I love working for IBM');
INSERT INTO comments VALUES('2','2012-01-03','03','2012-01-03 13:10:43.4','This job is the best');
INSERT INTO comments VALUES('2','2012-01-03','03','2012-01-03 19:49:07.4','Phew, what a long day');
INSERT INTO comments VALUES('1','2012-01-05','05','2012-01-05 10:03:24.5','Where’s the bathroom?');

Select * from users;
select * from comments;
select * from jan;

/* PROBLEM 1*/
Select DISTINCT users_state as State, COUNT(comments.comment) as Total
from users
join comments on users.users_id = comments.comment_id
group by users_state;

/* PROBLEM 2*/
select users.users_name, comment
from comments
join users on users.users_id = comments.comment_id
where com_timestamp in (
select max(com_timestamp)
from comments
group by comment_id
)
order by users_id;

/* PROBLEM 3*/
select jan_date, COUNT(comments.comment) as Total
from jan
left outer join comments on jan.jan_day = comments.com_day
where jan_date between '2012-01-01' and '2012-01-31'
group by jan_date;