DROP TABLE IF EXISTS Employees;
-- Employees Table
CREATE TABLE Employees(
            Emp_ID INT PRIMARY KEY,
			Name VARCHAR(100),
			Department VARCHAR(50),
			Salary DECIMAL(10,2)
);

INSERT INTO Employees (Emp_ID, Name,Department, Salary)
VALUES
(1,'Elon','Businessmen ',200000),
(2,'Virat','Data science ',1000000),
(3,'Saniya ','Sales',50000);

SELECT * FROM Employees;

DROP TABLE IF EXISTS Health;

--  Health Table Create
CREATE TABLE Health(
             Health_ID INT PRIMARY KEY,
			 Emp_ID int,
			 BloodGroup VARCHAR(5),
			 Height_cm DECIMAL (5,2),
			 Weight_kg DECIMAL (5,2),
			 MedicalCondition VARCHAR(100)
);

SELECT * FROM Health;

-- Step 2. Insert Sample Health Data
INSERT INTO Health(Health_Id,Emp_ID,BloodGroup,Height_cm,Weight_kg,MedicalCondition)
VALUES
 (101,1,'B', 162.5, 55.0,'None'),
 (102,2,'O', 175.0, 70.0,'Diabetes '),
 (103,3,'A', 160.0, 60.0,'Hypertension');

-- A. All Health Records
SELECT* FROM Health;


-- B.Show Records Medical Condition
SELECT e.Name, h.MedicalCondition
FROM Employees e, Health h
WHERE e.Emp_ID = h.Emp_ID 
    AND h.MedicalCondition <> 'None';

	
-- C. Average Weight Of all employees
SELECT AVG(Weight_kg) AS AvgWeight
FROM Health;

-- D. BMI Calculate
SELECT e.Name,
      ROUND(h.Weight_kg/
POWER(h.Height_cm/100,2),2) AS BMI
FROM Employees e, Health h
WHERE e.Emp_Id = h.Emp_ID;


-- E.Blood Group Wise Count of employees
SELECT e.Name, h.BloodGroup,
h.MedicalCondition
FROM Employees e,  Health h
WHERE e.Emp_ID = h.Emp_ID;

-- F. Department Wise average weight & height
SELECT e.Department,
      AVG(h.Weight_kg) AS AvgWeight,
	  AVG(h.Height_cm) AS AvgHeight
FROM Employees e, Health h
WHERE e.Emp_ID = h.Emp_ID
GROUP BY e.Department;





