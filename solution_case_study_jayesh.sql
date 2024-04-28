-- Case Study Question
select first_name,salary from employees where salary<(select max(salary) from employees )limit 1;
-- Q1. Show all records from all tables in hr dataset.

use hr;
show tables;

select* from countries;
select* from departments;
select* from dependents;
select* from employees;
select* from jobs;
select* from locations;
select* from regions;

-- Q2. Display employees who's department_id is 9 and doing job that has maximum salary more than 10000.

 select* from employees where department_id='9' and salary> 10000;

-- Q3. Display departments where the name of the manager is MICHAEL

select department_name from employees  
  inner join  departments on employees.department_id = departments.department_id
  where first_name='Michael';
  
-- Q4. Display jobs where the minimum salary is less than salary of employee 105.

select*from employees where salary < (select salary from employees where employee_id='105');

-- Q5.Display employee name and manager name of the employee.
SELECT e1.first_name AS "employee_name",
       e2.first_name AS "manager_name"
  FROM employees e1
  INNER JOIN employees e2
    ON e1.manager_id = e2.employee_id;
-- Q6. Display number of employees joined in each year into department 5 and 9.

select extract(Year from hire_date) as year ,count(first_name) as Count_employee_joined from employees where department_id in(5,9) group by (year) order by(year);

-- Q7. Display job id, department id and sum of salary by including all possible dimensions.

-- Q8. Display employee name and job title of jobs where salary of employee is between minimum and maximum salary for job.
select first_name,job_title,min_salary,max_salary from employees as e inner join jobs as j on e.job_id=j.job_id;
-- Q9. Display first name, job title, department name of employees who joined on 17th June.
select first_name,job_title,department_name,extract(day from hire_date),extract(month from hire_date) from employees as e inner join departments as d on e.department_id=d.department_id inner join jobs as j on e.job_id=j.job_id where day(hire_date) like 17 and month(hire_date) like 6 ;
-- Q10. Display employees where the first name or last name starts with S.
    select first_name ,last_name from employees where first_name LIKE ('S%') or last_name LIKE('S%');
-- Q11. Display employees who joined in the month of May.
select extract(month from hire_date)as month,first_name from employees where Month(hire_date) like 5;
-- Q12. Display first name and date of first salary of the employees.
SELECT first_name, hire_date, LAST_DAY(hire_date) FROM employees; 
-- Q13. Display first name and last name of employees who joined in 1997.
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date) LIKE 1997;

-- Q14. Display the first word in job title.
SELECT job_title,SUBSTR(job_title,1, POSITION(' ' IN job_title)) AS first_word_jopb_title  FROM jobs;

-- Joins Activity Question

-- Q1. Write a query in SQL to display the first name,last name,department number, and department name for each employee.
select first_name,last_name,department_name,d.department_id from employees as e inner join  departments as d on e.department_id=d.department_id ;
-- Q2. Write a query in SQL to display the first name, last name,department number, and department name for all employees for depatments 80 or 40.
-- there are no departmetn 80 or 40 in database? if you mena 8 or 4 then this is the code
select first_name,last_name, d.department_id,department_name from employees as e inner join departments as d on e.department_id = d.department_id where e.department_id in (8, 4);

-- Q3. Write a query in SQL to display those employees who contain a letter r to their first name and also display their last name,department,city,and state province.
select first_name,last_name, department_name,city,state_province from employees as e inner join departments as d  on e.department_id = d.department_id inner join locations as l on d.location_id = l.location_id where first_name like '%r%';
-- Q4. Write Query in SQL to display the first name,last name, department number and name, for all employees who have or have not any department. (Hint: Slove this query using left join).
SELECT first_name, last_name, e.department_id,department_name from employees as e left outer join departments as d on e.department_id = d.department_id;
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (500,'prince','yadav','prince@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,Null);
desc employees;
-- Q5. Write a query in SQL to display the department name, full name(first and last name) of manager, and their city.

select department_name,CONCAT(first_name, ' ',last_name) AS full_name, city from employees as e inner join departments as d on e.department_id = d.department_id inner join locations as l on d.location_id = l.location_id;