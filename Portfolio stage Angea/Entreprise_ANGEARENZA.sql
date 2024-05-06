-- Création de la table Dept
CREATE TABLE Dept (
    deptno INT NOT NULL PRIMARY KEY,
    dname VARCHAR(20) NOT NULL,
    loc VARCHAR(20) NOT NULL
);

-- Insertion des données dans la table Dept
INSERT INTO Dept (deptno, dname, loc) VALUES
(10, 'Accounting', 'New-York'),
(20, 'Research', 'Dallas'),
(30, 'Sales', 'Chicago'),
(40, 'Operations', 'Boston');

-- Création de la table Emp
CREATE TABLE Emp (
    empno INT NOT NULL PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    job VARCHAR(20) NOT NULL,
    mgr INT,
    hiredate DATE NOT NULL,
    sal DOUBLE(7,2) NOT NULL,
    comm DOUBLE(7,2),
    deptno INT NOT NULL,
    FOREIGN KEY (deptno) REFERENCES Dept(deptno)
);

-- Insertion des données dans la table Emp
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(7369, 'Smith', 'Clerk', 7902, '1981-12-17', 800.00, NULL, 20),
(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'Martin', 'Salesman', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'Scott', 'Analyst', 7566, '1981-11-09', 3000.00, NULL, 20),
(7839, 'King', 'President', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'Turner', 'Salesman', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'Adams', 'Clerk', 7788, '1981-09-23', 1100.00, NULL, 20),
(7900, 'James', 'Clerk', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'Ford', 'Analyst', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'Miller', 'Clerk', 7782, '1982-01-23', 1300.00, NULL, 10);

-- Création de la table Mission
CREATE TABLE Mission (
    missno INT NOT NULL PRIMARY KEY,
    empno INT NOT NULL,
    ciename VARCHAR(20) NOT NULL,
    local VARCHAR(20) NOT NULL,
    enddate DATE,
    FOREIGN KEY (empno) REFERENCES Emp(empno)
);

-- Insertion des données dans la table Mission
INSERT INTO Mission (missno, empno, ciename, local, enddate) VALUES
(209, 7654, 'BMW', 'Berlin', '2001-02-09'),
(212, 7698, 'Mac Do', 'Chicago', '2001-03-04'),
(213, 7902, 'Oracle', 'Dallas', '2001-04-11'),
(214, 7900, 'FIDAL', 'Paris', '2001-06-07'),
(216, 7698, 'IBM', 'Chicago', '2001-02-09'),
(218, 7499, 'Décathlon', 'Clermont', '2002-12-24'),
(219, 7782, 'BMW', 'Chicago', '2001-08-16');
