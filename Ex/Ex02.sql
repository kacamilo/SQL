/*  단일행 함수  */

/* 문자 함수 */

-- 첫 글자만 대문자로 INITCAP()

select email,
           initcap(email)       --initcap (column) 
from employees;

select initcap('aaaaa')
from dual;      -- 가상의 테이블

select email, initcap(email), department_id
from employees
where department_id = 100;


select lower('AAAAAAaaaa')
from dual;

select upper('AAAAAAaaaa')
from dual;

select first_name, lower(first_name), upper(first_name)
from employees
where department_id=100;

/* SUBSTR(컬럼명, 시작위치, 글자수) */
select substr ('abcdefg', -3,2)
from dual;

select  first_name, 
            substr(first_name,1,3), 
            substr(first_name,-3,2)   
from employees
where department_id = 100;

/* LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’) */
select first_name, lpad(first_name,10,'*'),
            rpad(first_name,10,'*')
from employees;

/* REPLACE (컬럼명, 문자1, 문자2) */
select first_name,
            replace(first_name, 'a','*')
from employees
where department_id=100;

select  first_name,
            replace (first_name, 'a','*'),
            replace (first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

select ltrim( '         aaaa           ' ) || '-----' ,                   
           rtrim( '        aaaa           ' ) || '-----',
           trim( '        aaaa           ' ) || '-----'
from dual;

/* 숫자 함수 */
-- ROUND(숫자, 출력을 원하는 자리수)  
select round(123.456, 2) as "r2",
            round(123.456,0) "r0",
            round(123.456, -1)  "r-1"--반올림 (-1 자리 반올림)
from dual;

--TRUNC(숫자, 출력을 원하는 자리수) 
select trunc (123.346, 2) "r2",
            trunc (123.456, 0) "r0",
            trunc (123.456, -1) "r-1"
from dual;

/* 날짜함수 */
select sysdate
from dual;

select sysdate, first_name
from employees;

-- MONTHS_BETWEEN(d1, d2)
select  sysdate, 
            hire_date,
            months_between (sysdate, hire_date)
from employees
where department_id = 110;

-- LAST_DAY ('날짜')        ======입력한 날짜의 마지막 일을 출력
select last_day('20/06/06'),
            last_day(sysdate)
from dual;

/* 변환 함수 */

--TO_CHAR(n, fmt) =========><<<<  숫자 --> 문자   >>>>
select first_name,
            salary * 12,
            to_char(9876, '99999'), 
            to_char(salary*12, '999999.999'),
            to_char(salary*12, '999,999,999'), --'999,999,999'라는 포맷에 대입 (1000 마다 ,(콤마) 찍기)
            to_char(salary*12, '99999,999')
from employees
where department_id = 110;

select to_char(9876, '99999'),
            to_char(9876, '099999'),
             to_char(9876, '$99999'),
              to_char(9876, '99,999')
from dual;

/* TO_CHAR(날짜, ‘출력모양’)  날짜 를 문자형으로 변환하기 */
select sysdate,
            to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;
--NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select  first_name,
            commission_pct,
            nvl(commission_pct, 0 ),
            salary *commission_pct,
            salary * nvl(commission_pct, 0)
from employees;

select  first_name,
            commission_pct,
            nvl(commission_pct, 0 ),
            salary *commission_pct,
            salary * nvl(commission_pct, 0),        -- nvl ( 컬럼명(commission_pct), null 일때의 값(0))
            nvl2(commission_pct, 1234, 0)          -- nvl2 ( 컬럼명(commission_pct), null이 아닐때의 값(0), null 일때의 값(0) )
from employees;

