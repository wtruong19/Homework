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
  
INSERT INTO users VALUES('1','Cody','Male','WI');
INSERT INTO users VALUES('2','Chris','Male','CA');

INSERT INTO comments VALUES('1','2012-01-02','02','2012-01-02 08:31:03.8','I love working for IBM');
INSERT INTO comments VALUES('2','2012-01-03','03','2012-01-03 13:10:43.4','This job is the best');
INSERT INTO comments VALUES('2','2012-01-03','03','2012-01-03 19:49:07.4','Phew, what a long day');
INSERT INTO comments VALUES('1','2012-01-05','05','2012-01-05 10:03:24.5','Where’s the bathroom?');

Select * from users;
select * from comments;

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
CREATE TABLE jan
(
  jan_day	    int(2)        NOT NULL,
  jan_date	    DATE          NOT NULL,
  comment		VARCHAR(1),
  CONSTRAINT pk_day PRIMARY KEY (jan_date)
  );
  
  INSERT INTO jan VALUES('01','2012-01-01',0);
  INSERT INTO jan VALUES('02','2012-01-02',0);
  INSERT INTO jan VALUES('03','2012-01-03',0);
  INSERT INTO jan VALUES('04','2012-01-04',0);
  INSERT INTO jan VALUES('05','2012-01-05',0);
  
  select * from jan;
  
  select jan_date, COUNT(comment) as Total
  from jan
  join comment on jan.jan_day = comments.com_day
  where comments.day = '2012-01-01';