-- Dataset: Latest Data Science Salaries
-- Source: Kaggle https://www.kaggle.com/datasets/iamsouravbanerjee/data-science-salaries-2023
-- Queried using: MySQL workbench


-- What is the average USD salary by Employee Residence?

SELECT `Employee Residence`, round(avg(`Salary in USD`),0)
FROM data_science_salaries.salaries
GROUP BY `Employee Residence`
ORDER BY `Employee Residence`;

-- What is the top salary in each Employee Residence by salary currency?
SELECT `Employee Residence`, `Salary Currency`, max(Salary)
FROM data_science_salaries.salaries
GROUP BY `Employee Residence`, `Salary Currency`
ORDER BY `Employee Residence`;

-- What is the job title with salary more than 100,000 in USD with employee residence in the United States?

SELECT `Job Title`, `Salary in USD`, `Employee Residence`
FROM data_science_salaries.salaries
WHERE `Employee Residence`= 'United States' AND `Salary in USD`> 100000
ORDER BY `Job Title`;


-- What is the number of employees in each Employee Residence?

select `Employee Residence`, count(`Job Title`)
from data_science_salaries.salaries
group by `Employee Residence`;

-- Identify the salaries which salaries are over and under 100,000 in 2023.

SELECT  `Company Location`,`Salary in USD`,
CASE WHEN `Salary in USD` > 100000 THEN "Over One Hundred Thousand"
     ELSE "Under One Hundred Thousand" END AS Salary_Status
from data_science_salaries.salaries
WHERE Year = 2023;
