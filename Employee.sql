create database lab1;
use lab1;
create table Employee(
	fname varchar(20) not null,
    minit varchar(1),
    lname varchar(20) not null,
    ssn varchar(9) not null,
    bdate date,
    address varchar(50),
    sex char,
    salary decimal(10,2),
    superssn varchar(15),
    dno int not null
);

create table Employee (
    Fname varchar(20), 
    Minit char, 
    Lname varchar(20), 
    Ssn varchar(9), 
    Bdate datetime, 
    Address varchar(30), 
    Sex char, 
    Salary int, 
    Super_ssn varchar(15), 
    Dno int
);
drop table Employee;
insert into Employee values(
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

drop table Employee;
select * from Employee;

create table Department(
    Dname varchar(20),
    Dnumber int, 
    Mgr_ssn varchar(10),
    Mgr_start_date date
);

insert into Department values(
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
    'HeadQuarters',1,
    '888665555',
    '1981-06-19'
);

select * from Department;

create table Location(
    Dnumber int,
    Dlocation varchar(20)
);

insert into Location values
    (1,'Houston'),
    (2,'Stafford'),
    (3,'Bellaire'),
    (4,'Sugarland'),
    (5,'Houston'
);

select * from Location;

create table Project(
    Pname varchar(20),
    Pnumber int,
    Plocation varchar(20),
    Dnum int
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
    Hours float
);

insert into Works_on values
    ('123456789',1,32.5),
    ('123456789',2,7.5),
    ('666884444',3,40.0),
    ('453453453',1,20.0),
    ('453453453',2,20.0),
    ('333445555',2,10.0),
    ('333445555',3,10.0),
    ('333445555',10,10.0),
    ('333445555',20,10.0),
    ('999887777',30,30.0),
    ('999887777',10,10.0),
    ('987987987',10,35.0),
    ('987987987',30,5.0),
    ('987654321',20,15.0),
    ('987654321',20,NULL
);

select * from Works_on;

create table Dependent (
    Essn varchar(10),
    Dependent_name varchar(10),
    Sex char,
    Bdate datetime, 
    Relationship varchar(10)
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
from Employee where
Fname = 'John' 
and 
Minit = 'B' 
and 
Lname = 'Smith';

select E.Fname , E.Minit , E.Lname , E.Address
from Employee E , Department D where
E.Dno = D.Dnumber
and 
D.Dname = 'Research';

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