create database test2;
use test2;

create table users(u_id int not null AUTO_INCREMENT PRIMARY KEY,u_fname varchar(50),u_lname varchar(50),u_email varchar(50),u_password varchar(50),u_rank int);
create table courses(c_id int not null AUTO_INCREMENT PRIMARY KEY,c_name varchar(50),c_since date,c_till date,c_link varchar(50),c_status varchar(20),c_catagory varchar(50));

create table enrolled_for(u_id int REFERENCES users(u_id),c_id int REFERENCES courses(c_id));
create table user_result(u_id int REFERENCES users(u_id),c_id int REFERENCES courses(c_id),points int);

create table instructor(i_id int not null AUTO_INCREMENT PRIMARY KEY,i_name varchar(50),i_email varchar(50),i_experience int,i_designation varchar(50));
create table course_by_instructor(i_id int REFERENCES instructor(u_id),c_id int  REFERENCES courses(c_id));


insert into users(u_fname,u_lname,u_email,u_password,u_rank) VALUES ("admin","admin","admin@admin.com","admin",0);
insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("mysql",'2017-09-20','2017-12-20',"mysql.php","Active","database");
insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("unix",'2017-09-20','2017-12-20',"unix.php","Active","operating system");
insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("IBM watson",'2017-09-20','2017-12-20',"watson.php","Active","artificial intelligence");

insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("C language",'2018-09-20','2017-12-20',"c.php","Inactive","language");
insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("core java",'2018-09-20','2017-12-20',"java.php","Inactive","language");
insert into courses(c_name,c_since,c_till,c_link,c_status,c_catagory) VALUES ("Python",'2016-09-20','2016-12-20',"python.php","Inactive","language");


insert into instructor(i_name,i_email,i_experience,i_designation) VALUES ("Pranav waikar","pkw@pkw.com",0,"student");
insert into instructor(i_name,i_email,i_experience,i_designation) VALUES ("Rohan patel","rhn@rohan.com",0,"student");
insert into instructor(i_name,i_email,i_experience,i_designation) VALUES ("Pratik deshmukh","pratik@virat.com",0,"student");


insert into course_by_instructor (i_id,c_id)VALUES (1,1);
insert into course_by_instructor (i_id,c_id)VALUES (2,2);
insert into course_by_instructor (i_id,c_id)VALUES (3,3);
insert into course_by_instructor (i_id,c_id)VALUES (1,4);
insert into course_by_instructor (i_id,c_id)VALUES (2,5);
insert into course_by_instructor (i_id,c_id)VALUES (3,6);

/* For active courses */
select * from courses where c_status='a';
/* For inactive courses */
select * from courses where c_status='i';
/* For enrolled courses */
select c_name,c_since,c_till,c_link,c_catagory,c_status from courses c,enrolled_for e where (e.u_id=1 and e.c_id=c.c_id);
/* For result of user */
select c_name,points from courses c,user_result r where(r.u_id=1 and r.c_id=c.c_id);

UPDATE users SET u_fname= '$first', u_lname='$last' u_email='$emailid' where u_id='$_SESSION['u_id']';

/* For instructor and course merge*/
select c_name,c_since,c_till,c_catagory,c_status,c_link,i_name from courses c,instructor i,course_by_instructor b where (b.i_id=i.i_id and b.c_id=c.c_id);
/* For osrting by catagory*/
select c_name,c_since,c_till,c_status,c_link,c_catagory from courses order BY c_catagory;

drop database test2;