-- Total Number of Employees
SELECT COUNT(Employee_ID) AS Total_Employees FROM employees;

-- Number of employees who left
SELECT COUNT(Employee_ID) AS Employees_Left FROM employees WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT (SELECT COUNT(Employee_ID) FROM employees WHERE Attrition = 'Yes') / 
(SELECT COUNT(Attrition) FROM employees) * 100.0 AS Attrition_Rate;

-- Attrition Count For Each Dept
SELECT Department, COUNT(Employee_ID) AS Attrition_per_dept FROM employees 
WHERE Attrition = 'Yes' GROUP BY Department;

-- Dept with the highest Attrition
SELECT Department, COUNT(Employee_ID) AS Attrition_per_dept FROM employees 
WHERE Attrition = 'Yes' GROUP BY Department ORDER BY Attrition_per_dept DESC LIMIT 1;

-- Employee Distribution per Dept
SELECT Department, COUNT(Employee_ID) AS Emp_Distribution_Per_Dept FROM employees 
GROUP BY Department ORDER BY Emp_Distribution_Per_Dept;

-- Attrition per Salary Groups
SELECT Salary_Group, Attrition, COUNT(Employee_ID) AS Attrition_by_Salary_Group FROM employees 
GROUP BY Salary_Group, Attrition 
HAVING Attrition = 'Yes' 
ORDER BY Attrition_by_Salary_Group DESC;

-- Attrition by Years of experience
SELECT Experience_Range, COUNT(Employee_ID) AS Attrition_per_Experince_Range FROM employees 
GROUP BY Experience_Range, Attrition 
HAVING Attrition = 'Yes' ORDER BY Attrition_per_Experince_Range DESC;

-- Experience Range with the highest attrition
SELECT Experience_Range, Attrition, COUNT(Employee_ID) AS Attrition_per_Experience_Range 
FROM employees 
GROUP BY Experience_Range, Attrition HAVING Attrition = 'Yes' 
ORDER BY Attrition_per_Experience_Range DESC LIMIT 1;

-- Attrition Distribution by Job Satisfaction
SELECT Job_Satisfaction, Attrition, COUNT(Employee_ID) AS Attrition_by_Job_Satisfaction 
FROM employees 
GROUP BY Job_Satisfaction, Attrition 
ORDER BY Job_Satisfaction;

-- Top 3 satisfaction levels with the highest attrition
SELECT Job_Satisfaction, Attrition, COUNT(Employee_ID) AS Attrition_by_Job_Satisfaction 
FROM employees GROUP BY Job_Satisfaction, Attrition 
HAVING Attrition = 'Yes' 
ORDER BY Attrition_by_Job_Satisfaction DESC LIMIT 3;

-- Average Satisfaction of employees who left vs who stayed
SELECT Attrition, AVG(Job_Satisfaction) AS Average_Satisfaction FROM employees GROUP BY Attrition; 

--  Comparison of attrition across different work-life balance levels 
SELECT Work_Life_Balance, COUNT(Employee_ID) AS Attrition_by_Work_Life_Balance FROM employees 
GROUP BY Work_Life_Balance, Attrition 
HAVING Attrition = 'Yes' 
ORDER BY Attrition_by_Work_Life_Balance DESC;

-- Distribution of attrition by salary and work-life balance
SELECT  Salary_Group, Work_Life_Balance, Attrition, COUNT(Employee_ID) AS Count
FROM employees
GROUP BY Salary_Group, Work_Life_Balance, Attrition
ORDER BY Salary_Group, Work_Life_Balance; 









