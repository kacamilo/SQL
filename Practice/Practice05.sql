/* 혼합 SQL 문제입니다. */

/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)*/
select first_name "직원 이름",
       manager_id"매니저 아이디",
       commission_pct"커미션 비율",
       salary"월급"
from   employees
where salary>3000
and manager_id is not null
and commission_pct is null;



/*문제2.  
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)*/
select employee_id"직원번호",
       first_name"이름",
       salary"급여",
       to_char(hire_date,'YYYY-MM-DD day')"입사일",
       replace(phone_number,'.','-')"전화번호",
       department_id"부서번호"
from employees
where (department_id, salary) in (select department_id, max(salary)
                            from employees
                           group by department_id 
                            )
order by salary desc;

select max(salary) salary
from employees;


/* 문제3
매니저별로 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
(9건)
 */
 
 
 select emp.employee_id,
        emp.first_name,
        avg_sal,
        min_sal,
        max_sal
from employees emp, (select round(avg(salary),0) avg_sal,
                            min(salary) min_sal,
                            max(salary) max_sal,
                            manager_id
                     from employees
                     where hire_date >= '06/01/01'
                     group by manager_id
                     having avg(salary) >= 5000) man
where emp.employee_id = man.manager_id;




/*문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)*/

select em.employee_id"사번",
       em.first_name"이름",
       em.department_id,
       de.department_id,
       de.department_name"부서명",
       man.first_name"매니져이름"
from  employees em, departments de, employees man
where em.department_id = de.department_id(+)
and em.manager_id = man.employee_id;


/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요 */
select rn,
       em.employee_id"사번",
       em.first_name"이름",
       em.last_name,
       em.department_id"부서명",
       em.salary"급여",
       em.hire_date"입사일"
from (select  rownum rn,
              s.employee_id,
              s.first_name,
              s.last_name,
              s.department_id,
              s.salary,
              s.hire_date
       from (select employee_id,
                   first_name,
                   last_name,
                   department_id,
                   salary,
                   hire_date
             from employees
             where hire_date>= '06/01/01'
             order by hire_date asc)s
                )em
                
where rn >= 11
and rn <= 20;






문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?

select  em.first_name ||' '||last_name "이름",
        em.salary"연봉",
        de.department_name"부서 이름"
from employees em, 
     departments de
where em.department_id = de.department_id
and hire_date = (select max(hire_date)
                        from employees);
                                



/*문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과  업무(job_title), 연봉(salary)을 조회하시오.*/

select e.employee_id,
       e.first_name,
       e.last_name,
       j.job_title,
       e.salary
from employees e, 
     jobs j
where e.job_id = j.job_id
and e.department_id = 
                    (select  de.department_id
                        from departments de, employees em 
                        where de.department_id = em.department_id
                        group by de.department_id
                        having avg(salary)=(select 
                                                max(avg(salary))
                                                from employees
                                                group by department_id)
                                                );
select e.employee_id,
       e.first_name,
       e.last_name,
       j.job_title,
       e.salary
from employees e, 
     jobs j
where e.job_id = j.job_id
and e.department_id = 
                    (select  em.department_id
                        from employees em 
                        group by em.department_id
                        having avg(salary)=(select 
                                                max(avg(salary))
                                                from employees
                                                group by department_id)
                                                );

/* 문제8.
평균 급여(salary)가 가장 높은 부서는? */
 
select d.department_name
from departments d, 
                    (select avg(salary) salary,
                            department_id
                    from employees
                    group by department_id) de,
                                                (select max(avg(salary)) salary
                                                 from employees
                                                 group by department_id)s
where d.department_id = de.department_id
and de.salary = s.salary;


문제9.
평균 급여(salary)가 가장 높은 지역은? 

select 
        region_name
from    
        (select 
                rownum rn,
                region_name,
                salary
        from
                ( select 
                        re.region_name,
                        avg(em.salary) salary
                  from
                        employees em,
                        regions re,
                        departments de,
                        locations lo,
                        countries co
                
                  where 
                        em.department_id = de.department_id
                  and   
                        de.location_id = lo.location_id
                  and   
                        lo.country_id = co.country_id
                  and   
                        co.region_id = re.region_id
                  group by 
                        re.region_name))
                        
where rn =1;

문제10.
평균 급여(salary)가 가장 높은 업무는? 

select s.job_title
from 
        employees e, 
        jobs s, 
                (select 
                        avg(salary)salary,
                        job_id
                   from 
                        employees
                   group by 
                            job_id)jo,
                                        (select 
                                                max(avg(salary))max_salary
                                           from
                                                employees
                                            group by job_id) ju
 
where e.job_id = s.job_id
and e.job_id = jo.job_id
and jo.salary = ju.max_salary;

