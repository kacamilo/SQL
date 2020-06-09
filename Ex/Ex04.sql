select * from departments;    --27

select * from employees;    --107

/* JOIN */
/*두 개의 테이블이 있기때문에 이름이 겹치는 경우가 있기때문에
테이블에 별명을 부여해줘야한다. 컬럼에 정확한 출처를 붙여준다.*/

select  em.employee_id,
            em.first_name,
            em.department_id edid,
            de.department_id deid,
            de.department_name
from employees em, departments de
where  em.department_id = de.department_id;

select count(*)
from employees, departments;

/* 모든 직원이름, 부서이름, 업무명 을 출력하세요 */

select em.first_name || ' ' || last_name "이름",
            em.job_id "부서이름",
            jb.job_id ,
            jb.job_title"업무명"
from employees em, jobs jb
where em.job_id = jb.job_id;

/* OUTER JOIN ===> NULL을 포함하여 결과 생성*/

/* LEFT OUTER JOIN ~ ON  <<왼쪽 테이블의 모든 ROW를 테이블에 나타냄>> */
select  e.department_id, 
            e.first_name,
            d.department_name
from employees e left outer join departments d
          on e.department_id = d.department_id;
          
-- (+)를 사용할때 기준은 반대편이 된다.
select  e.department_id, 
            e.first_name,
            d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select  e.department_id,
            e.first_name,
            d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

/* RIGHT OUTER JOIN ~ ON <<오른쪽 테이블의 모든 ROW를 테이블에 나타냄>> */

select  e.employee_id,
            e.first_name,
            e.department_id,
            d.department_id,
            d.department_name
from employees e right outer join departments d
          on e.department_id = d.department_id;

select  e.employee_id,
            e.first_name,
            e.department_id,
            d.department_id,
            d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

/* FULL OUTER JOIN ~ ON <<양쪽 테이블의 모든 ROW를 테이블에 나타냄>> */

/* SELF JOIN */
SELECT  emp.employee_id,
              emp.first_name,
              emp.salary,
              emp.manager_id,
              man.employee_id,
              man.first_name,
              man.salary
FROM employees emp, employees man
WHERE emp.manager_id = man.manager_id;


select *
from employees;


