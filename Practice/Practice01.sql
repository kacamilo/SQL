--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id,
            salary,
            first_name
from employees
order by department_id asc;

--급여가 1000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name,
            salary
from employees
where salary >=1000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id,
            salary,
            first_name
from employees
order by department_id asc, salary desc;





