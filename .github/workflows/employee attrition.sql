# Checking out the database
SELECT *
FROM singular-winter-432015-t7.employee_attrition.employee

# Writing a SQL query to find details of employees under attrition having 5+ years in the company between the age group og 25-40
SELECT *
FROM singular-winter-432015-t7.employee_attrition.employee
WHERE 
 age BETWEEN 25 AND 40
 AND YearsAtCompany >= 5
 AND Attrition IS true

# Writing a SQL query to get the details of employees having minimum and maximum salary in different departments who have salary above 50k
SELECT
 Department,
 MAX(Salary) AS max_salary,
 MIN(Salary) AS min_salary
FROM singular-winter-432015-t7.employee_attrition.employee
WHERE Attrition IS true AND Salary > 50000
GROUP BY Department
ORDER BY max_salary DESC

# Identify the total number of male and female employees who were in the company for more than 5 years and haven't received a promotion in the last 2 years
SELECT 
 Gender, count(EmployeeID)
FROM singular-winter-432015-t7.employee_attrition.employee
WHERE Attrition IS true AND YearsSinceLastPromotion >= 2
GROUP BY Gender

#Using JOINS
# Check the data and then count how many employees have manager rating of more than 4 and have still not received promotion for more than 4 years, then compare the numbers with how many of these people have already left
SELECT COUNT(*)
FROM singular-winter-432015-t7.employee_attrition.employee as employee
INNER JOIN
 singular-winter-432015-t7.employee_attrition.performance_rating as performance
 ON employee.EmployeeID = performance.EmployeeID
WHERE ManagerRating >= 4 AND YearsSinceLastPromotion >= 4

SELECT COUNT(*)
FROM singular-winter-432015-t7.employee_attrition.employee as employee
INNER JOIN
 singular-winter-432015-t7.employee_attrition.performance_rating as performance
 ON employee.EmployeeID = performance.EmployeeID
WHERE ManagerRating >= 4 AND YearsSinceLastPromotion >= 4 AND Attrition IS true

# Checking the relation between environment consciousness of the employee and the distance they have to travel by car to workplace
SELECT *
FROM singular-winter-432015-t7.employee_attrition.employee as employee
INNER JOIN
 singular-winter-432015-t7.employee_attrition.performance_rating as performance
 ON employee.EmployeeID = performance.EmployeeID
WHERE EnvironmentSatisfaction >= 4 and `DistanceFromHome _KM_` <= 20 and Attrition is false
