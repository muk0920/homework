-- [1] 사원정보(EMPLOYEE) 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원
번호를 출력하시오. 이때 이름은 성과 이름을 연결하여 Name이라는 별칭으로 출력하시오.
select employee_id
    , concat(first_name,' ',last_name) as 'Name'
    , salary
    , job_id
    , hire_date
    , manager_id
    from employees;

-- [2] HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 사원정보
(EMPLOYEES) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 성과 이름(Name으로 별칭) 및 급여를 급여가 작은 순서로 출력하시오.
select concat(first_name,' ',last_name) as 'Name'
    , salary
    from employees
        where salary not between 7000 and 10000 
        order by salary asc;

-- [3] 사원의 이름(last_name) 중에 ‘e’ 및 ‘o’ 글자가 포함된 사원을 출력하시오. 이때 머리글은 ‘e and o Name’라고 출력하시오.
select last_name as 'e and o Name'
	from employees
    where last_name like '%e%'
		and last_name like '%o%';   

-- [4] HR 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 이에 수당을 받는 모든 사원의 성과 이름(Name으로 별칭), 급여, 업무, 수당율, (연봉 출력) 을 출력하시오. 이때 연봉이 큰 순서대로 정렬하되, 연봉이 같으면 급여가 큰 순서대로 정렬하시오.
select concat(first_name,' ',last_name) as 'Name'
	, salary
    , job_id
    , commission_pct
    , ( salary * 12 * (1 + commission_pct) ) as 'Annual salary'
    from employees
	where commission_pct is not null
		order by 5 desc, commission_pct desc;
        
-- [5] 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 업무, 급여 평균을 출력하시오. 단 업무에 사원(CLERK)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 출력하시오.
select job_id
    , avg(salary) as 'Avg Salary'
	from employees 
     where job_id not like '%CLERK%'
		group by job_id having avg(salary) >= 10000 
		order by avg(salary) desc;

