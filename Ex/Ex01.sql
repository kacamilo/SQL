select * from employees;


select * from departments;


select employee_id, first_name, last_name from employees;

--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary 
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
-- 가독성 높여주기 위해  정리해준다.
select first_name,
           last_name,
           phone_number,
           email,
           hire_date
from employees;

/*select 문 별명*/
select employee_id as empNO, 
           first_name  "E-name", 
           salary "연 봉" 
from employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요
select first_name "이 름",
           phone_number "전화번호",
           hire_date "입사일",
           salary "급여"
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select first_name "이 름",
           last_name "성",
           salary "급여",
           phone_number"전화번호",
           email "이메일",
           hire_date "입사일"
from employees;

--select 문 컬럼 합치기

select first_name ||' '|| last_name
from employees;

select first_name || ' hire date is ' || hire_date as empINFO
from employees;

--홑따옴표
select first_name || ' '' hire date is '' ' || hire_date as empINFO
from employees;

/*산술 연산자 사용하기*/
select first_name, salary
from employees;

select first_name, salary, salary * 12
from employees;

select first_name, salary, salary *12, (salary + 300) *12 , salary/30
from employees;

select job_id
from employees;

/*
전체직원의 정보를 다음과 같이 출력하세요
성명(first_name last_name)
성과 이름사이에 – 로 구분 ex) William-Gietz급여연봉(급여*12)연봉2(급여*12+5000)전화번호
*/

select first_name || '-' || last_name "성명",
           salary "급여",
           salary*12 "연봉",
           salary*12+5000 "연봉2",
           phone_number "전화번호"
from  employees;

/* where 절 */

select first_name
from employees
where department_id = 10;

--연봉이 15000이상인 사원들의 이름과 연봉을 출력
select first_name,
            salary
from employees
where salary>=15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name,
            hire_date
from employees
where hire_date > '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
--문자, 날짜는 ‘ ‘ 로 감싸줌    ‘ ‘는 대소문자를 구분한다

select first_name,
            salary
from employees
where first_name = 'Lex';

/*  조건이 2개 이상일때 한꺼번에 조회하기 */
select first_name, salary
from employees
where salary >= 14000
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary <= 14000
OR salary>= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name,
            hire_date
from employees
where hire_date > '04/01/01'
and hire_date < '05/12/31';

/* beetween 연산자 << 작은 값 앞 / 큰 값 뒤>> */
select first_name, salary
from employees
where salary between 14000 and 17000;

/* IN 연산자 - 여러조건 검사( OR를 사용한것과 동일. 모두 만족이 아님) */
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');
--  같은 결과
select first_name, last_name, salary
from employees
where first_name = 'Neena'
or  first_name = 'Lex'
or  first_name = 'John';

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name, salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

/* Like   연산자 비슷한것들 모두 찾기 ([ _ ] 언더바는 자리수를 나타낸다),(% 는 블라블라와 같은 맥락) */
select first_name, last_name, salary
from employees
where first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name, salary
from employees
where first_name like '___a';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name, salary
from employees
where first_name like '_a__';

/* NULL */
select  first_name,
            salary, 
            commission_pct, 
            salary * commission_pct
from employees
where salary between 13000 and 15000;

/* is null*/    -- null 인 목록만 뽑기
select first_name, salary, commission_pct
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary, commission_pct
from employees
where commission_pct is not null;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

/* order by 절을 사용해 보기 좋게 정렬하기 */
-- desc ---> 내림차순
-- asc ---> 올림차순
select first_name, salary
from employees
where salary >= 9000
order by salary desc, first_name asc;

select first_name, salary
from employees
where salary >= 9000
order by salary asc;

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





