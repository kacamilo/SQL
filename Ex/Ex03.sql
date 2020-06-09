/* 그룹함수 */

-- avg (평균)
select salary, first_name
from employees;

select avg(salary), employee_id,
first_name || ' ' || last_name
from employees 
group by employee_id, first_name || ' ' || last_name;

-- count (카운트)
select count (*)        -- null 포함(특정 컬럼을 지정하지 않음)
from employees;

select *
from employees;

select count(manager_id)        -- null 제외(특정 컬럼을 지정하였기 때문)
from employees;

select count(*), count (commission_pct) , avg(salary)    -- null 제외
from employees;
        
select count(*)         
from employees
where salary > 16000;

-- sum (합계)
select sum(salary)
from employees
where salary > 16000;

select sum(salary), count(*)
from employees;

/* avg() */
--manager_id 테스트(논리적x) ====> null 값이 있는 경우 계산에 포함하지 않음
select avg(manager_id), count(*)
from employees
where salary > 16000;

-- null 데이타를 0으로 변경
select avg(nvl (manager_id,0))
from employees
where salary > 16000;

/* max() / min() */
select salary
from employees
order by salary desc;

select max(salary), min(salary), sum(salary)
from employees;

/* GROUP BY 절 */
select department_id, salary
from employees
order by department_id asc;

select department_id, avg(salary)
from employees
group by department_id
order by department_id asc;

select count(*), sum(salary), department_id, job_id
from employees
group by department_id, job_id;

select sum(salary)
from employees
group by department_id;

 select department_id, count(*), sum(salary)
 from employees
 group by department_id
having sum(salary) >= 20000;

/* HAVING */
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 2000;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and department_id = 100;

/* CASE ~ END문 / DECODE() 함수 */

select employee_id,
           first_name,
           job_id,
           salary,
           case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
                    when job_id = 'SA_REP'           then  salary + salary * 0.2
                    when job_id = 'ST_CLERK'      THEN salary + salary * 0.3
                    else salary
           end realSalary --"컬럼명 지정해주기"
from employees;
    --case end문 조건식을 쓸 수 있다.
select employee_id,
           first_name,
           job_id,
           salary,
           case when salary >= 20000              then salary
                    when salary >= 10000              then  salary + salary * 0.2
                    when salary >= 1000                THEN salary + salary * 0.3
                    else salary
           end realSalary --"컬럼명 지정해주기"
from employees;

/* DECODE() 함수 */
select employee_id,
           salary,
           DECODE   ( job_id, 'AC_ACCOUNT', salary + salary * 0.1,
                                         'SA-REP',            salary + salary * 0.2,
                                         'ST-CLERK',        salary + salary * 0.3,
                            salary ) realSalary
from employees;

select employee_id,
            salary,
            DECODE ( job_id, 'AC_ACCOUNT', salary + salary * 0.1, salary) realSalary
from employees;

SELECT employee_id, 
       salary,
	 DECODE( job_id, 'AC_ACCOUNT', salary + salary * 0.1,
                        'SA_REP',     salary + salary * 0.2,
		              'ST_CLERK',   salary + salary * 0.3,
               salary ) realSalary
FROM employees;

select  first_name,
            department_id,
          CASE WHEN department_id >=10 AND department_id<=50 THEN 'A-TEAM'
                    WHEN department_id >=60 AND department_id <=100 THEN 'B-TEAM'
                    WHEN department_id >=110 AND department_id <=150 THEN 'C-TEAM'
                    ELSE '팀없음'
          END team
from employees
ORDER BY department_id asc;