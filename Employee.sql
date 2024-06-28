create database lab1;
use lab1;
drop database lab1;

CREATE TABLE employee ( 
	Fname varchar (15) NOT NULL,
	Minit varchar(1), 
	Lname varchar(15) NOT NULL, 
	SSN varchar(9) NOT NULL, 
	Bdate date, 
	Address varchar(30), 
	Sex varchar(1), 
	Salary float, 
	Super_ssn varchar(9), 
	Dno int not null, 
	PRIMARY KEY (SSN)
);
insert into employee values(
    'John', 
    'B', 
    'Smith',
    '123456789', 
    '1965-01-09', 
    '731 Fondren, 
    Houston TX', 
    'M', 
    30000, 
    333445555, 
    5
),( 
    'Franklin', 
    'T', 
    'Wong',
    '333445555', 
    '1955-12-08', 
    '638 Voss, Houston TX', 
    'M', 
    40000, 
    888665555, 
    5
),( 
    'Alicia', 
    'J', 
    'Zelaya',
    '999887777', 
    '1968-01-19', 
    '3321 Castle Spring TX', 
    'F', 
    25000, 
    987654321, 
    4
),( 
    'Jennifer', 
    'S', 
    'Wallace',
    '987654321', 
    '1941-06-20', 
    '291 Berry, Bellaire TX', 
    'F', 
    43000, 
    888665555, 
    4
),( 
    'Ramesh', 
    'K', 
    'Narayan',
    '666884444', 
    '1962-09-15', 
    '975 Fire Oak, Humble TX',
    'M', 
    38000, 
    333445555, 
    5
),( 
    'Joyce', 
    'A', 
    'English',
    '453453453', 
    '1972-07-31', 
    '5631 Rice Houston TX', 
    'F', 
    25000, 
    333445555, 
    5
),( 
    'Ahmad', 
    'V', 
    'Jabbar',
    '987987987', 
    '1969-03-29', 
    '980 Dallas Houston TX', 
    'M', 
    25000, 
    98654321, 
    4
),( 
    'James', 
    'E', 
    'Borg',
    '888665555', 
    '1937-11-10', 
    '540 Stone Houston TX', 
    'M', 
    55000, 
    NULL, 
    1
);

drop table employee;
select * from employee;

create table department(
    Dname varchar(20),
    Dnumber int, 
    Mgr_ssn varchar(9),
    Mgr_start_date date,
    unique(Dname),
    primary key(Dnumber),
    foreign key(Mgr_ssn) references employee(SSN)
);
drop table department;
insert into department values(
    'Research',
    5,
    '333445555',
    '1988-05-22'
),(
    'Administration',
    4,
    '987654321',
    '1995-01-01'
),(
	'Finance' , 3 , '666884444' , '1994-01-11'
),(
	'Management' , 2 , '123456789' , '1985-03-04'
),(
    'HeadQuarters',1,
    '888665555',
    '1981-06-19'
);

select * from Department;

create table location(
    Dnumber int,
    Dlocation varchar(20),
	PRIMARY KEY (Dnumber, Dlocation), 
    foreign key(Dnumber) references department(Dnumber)
);
drop table location;
insert into location values
    (1,'Houston'),
    (2,'Stafford'),
    (3,'Bellare'),
    (4,'Sugarland'),
    (5,'Houston'
);

drop table location;
select * from location;

create table Project(
    Pname varchar(20),
    Pnumber int,
    Plocation varchar(20),
    Dnum int,
    primary key (pnumber),
    unique(Pname),
    foreign key(Dnum) references department(Dnumber)
);

insert into Project values
    ('ProductX',1,'Bellaire',5),
    ('ProductY',2,'Sugarland',5),
    ('ProductZ',3,'Houston',5),
    ('Computerization',10,'Stafford',4),
    ('Reorganization',20,'Houston',4),
    ('Newbenefits',30,'Stafford',4
);

select * from Project;

create table Works_on(
    Essn varchar(20),
    Pno int,
    Hours float,
    primary key(Essn , Pno),
    foreign key(Essn) references employee(ssn),
    foreign key(Pno) references department(Dnumber)
);

insert into Works_on values
    ('987654321',20,NULL
);

select * from Works_on;

create table Dependent (
    Essn varchar(10) not null,
    Dependent_name varchar(10),
    Sex char,
    Bdate datetime, 
    Relationship varchar(10),
    primary key(Essn , Dependent_name),
    foreign key(Essn) references employee(SSN)
);

insert into Dependent values(
    '333445555',
    'Alice',
    'F',
    '1986-04-05',
    'Daughter'
),(
    '333445555',
    'Theodore',
    'M',
    '1983-10-25',
    'Son'
),(
    '333445555',
    'Joy',
    'F',
    '1958-05-03',
    'Spouse'
),(
    '987654321',
    'Abner',
    'M',
    '1942-02-28',
    'Spouse'
),(
    '123456789',
    'Michael',
    'M',
    '1988-01-04',
    'Son'
),(
    '123456789',
    'Alice',
    'F',
    '1988-12-30',
    'Daughter'
),(
    '123456789',
    'Elizabeth',
    'F',
    '1967-05-05',
    'Spouse'
);

select * from Dependent;

select Bdate , Address
from employee where
Fname = 'John' 
and 
Minit = 'B' 
and 
Lname = 'Smith';

select Fname , Minit , Lname , Address
from employee , department where
Dno = Dnumber
and 
Dname = 'Research';

select e.Lname , e.Bdate , e.Address , p.Pnumber , p.Dnum 
from Employee e , Project p where
p.Plocation = 'Stafford'
and
e.Dno = p.Dnum;

select e1.Fname , e1.Lname , e2.Fname , e2.Lname
from Employee as e1 , Employee as e2 where
e2.Ssn = e1.Super_ssn;

select e.ssn, d.dname 
	from Employee e,Department d
	WHERE e.ssn=d.Mgr_ssn;
    
select distinct salary  
	from Employee;

select city , avg(marks) from
student
group by city
order by avg(marks) asc;

select p.Pnumber from
employee e , Project p where
e.Lname = 'Smith'
and 
e.Dno = p.Dnum;

select * from
Employee where
Address like '%Hous%';

select * from
Employee where
bDate like '195%';

select * from
employee , department where
Dno = Dnumber and
Dnumber = 5 and
Salary between 30000 and 40000;

select Fname , Minit , Lname from 
Employee where
Super_ssn is null;

select Fname , Minit , Lname from 
employee e, Dependent d where
e.Fname = Dependent_name
and 
e.Sex = d.Sex;

select Fname ,Minit, Lname from
employee where
not exists(select * from Dependent where SSN = Essn);

select Fname ,Minit, Lname from
employee where
exists(select * from Department where SSN = Mgr_ssn and Dno = Dnumber)
and 
exists(select * from Dependent where SSN = Essn);

select distinct Essn from
Works_on where
Pno = 1 or Pno = 2 or Pno = 3;

select sum(Salary) , max(salary) , min(salary) , avg(salary) from 
Employee , Department where
Dno = Dnumber and
Dname = 'Research';

select COUNT(distinct salary) 
		from Employee;

select COUNT(*),Dno,AVG(salary) 
	from Employee 
	group by Dno;