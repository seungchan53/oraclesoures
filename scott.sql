-- RDBMS
-- 기본 단위 : 테이블

-- EMP(사원정보 테이블)
-- empno(사번),ename(사원명), job(직책), mgr(직속상관사번), hiredate(입사일), sal(급여), comm(추가수당), deptno(부서번호)
-- NUMBER(4,0) : 전체 자릿수 4자리(소수점 자릿수 0)
-- VARCHAR2(10) :문자열 10Byte (VAR: 가변 - 7Byte 문자열 저장했다면 7Byte 공간만 사용)
--				 영어 10문자,한글 2byte, utf-8 3byte 할당
--DATE : 날짜

-- DEPT(부서테이블)
-- deptno(부서번호), dname(부서명), loc(부서위치)

-- SALGRADE(급여테이블)
-- grade(급여등급), losal(최저급여), hisal(최대급여)

-- 개발자 : CRUD
-- SQL(Structured Query Language : 구조질의 언어) : RDBMS 데이터를 다루는 언어


-- 1. 조회(SELECT) - Read
-- 사원정보조회(전체 조회)
-- * (모든 열)
SELECT * FROM EMP e;

SELECT e.EMPNO, e.ENAME, e.JOB FROM EMP e;

-- 사원번호, 부서번호만 조회
SELECT e.EMPNO, e.DEPTNO FROM EMP e;

SELECT deptno FROM emp;

SELECT DISTINCT deptno FROM EMP emp;

SELECT DISTINCT job, deptno FROM emp;

-- 별칭
SELECT ENAME, sal, sal * 12 + comm AS "annsal",comm FROM EMP ;

SELECT ENAME, sal, sal * 12 + comm AS 연봉,comm FROM EMP ;

SELECT ENAME, sal, sal * 12 + comm AS "연 봉",comm FROM EMP ;

SELECT ENAME 사원명, sal 급여, sal * 12 + comm AS "연 봉",comm 수당 FROM EMP ;

-- 원하는 순서대로 철력 데이터를 정렬(오름, 내림)
-- 오름차순 일 때 asc 생략 가능
-- emp 테이블의 모든 열을 급여 기준으로 오름차순 조회
SELECT * FROM emp e ORDER BY e.SAL ASC ;
SELECT * FROM emp e ORDER BY e.SAL;
-- 내림 차순
SELECT * FROM emp e ORDER BY e.SAL DESC;
-- 사원,이름,직무만 급여기준으로 내림차순 조회

SELECT e.EMPNO, e.ENAME,e.JOB FROM EMP e ORDER BY e.SAL DESC;

SELECT * FROM EMP e ORDER BY e.DEPTNO ASC, e.SAL DESC;

SELECT
	e.EMPNO EMPLOYEE_NO,
	e.ENAME EMPLOYEE_NAME,
	e.mgr MANAGER,
	e.SAL SALARY,
	e.COMM COMMISSION,
	e.DEPTNO DEPARTMENT_NO
FROM
	emp e;

SELECT * 



-- SQL 작성

-- 1. 조회할 테이블 EMP 테이블이며 모든 열을 출력한다.

-- 2. 출력 되는 열의 별칭을 다음과 같이 지정한다. 

-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- 3. 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 
-- 	  사원이름을 기준으로 오름차순 정렬한다.

-- where : 조회 시 조건 부여
-- 부서 번호가 30번인 사원 조회
SELECT *
FROM emp e
WHERE e.DEPTNO = 30;

-- 사번이 7782인 사원 조회

SELECT
	*
FROM
	emp e
WHERE
	e.EMPNO = 7782;
-- 부서번호가 30이고 직책이 SALESMAN 사원 조회
-- 오라클애서 문자는 '' 만 허용, 대소문자 구분

SELECT
	*
FROM
	emp e
WHERE
	e.DEPTNO = 30 AND e.JOB = 'SALESMAN';

-- 사번 7499 이고 부서 번호가 30 사원조회

SELECT
	*
FROM
	emp e
WHERE
	e.EMPNO = 7499 AND e.DEPTNO = 30;

-- 사번 7499 이거나 부서 번호가 30 사원조회

SELECT
	*
FROM
	emp e
WHERE
	e.EMPNO = 7499 OR e.DEPTNO = 30;


-- 연산자
-- 1) 산술 연산자 : +,-,*,/
-- 2) 비교 연산자 : <,>,>=,<=,=
-- 3) 등가비교연산자 : =, 같지 않다( !=, <> , ^= )
-- 4) 논리부정연산자 : NOT 
-- 5) 		     : IN 
-- 6) 범위 : BETWEEN A AND B
-- 7) 검색 : LIKE 연산자와 와일드 카드(_,%)
-- 8) IS NULL


-- 연봉이(SAL*12) 36000 원 사원 조회
SELECT *
FROM EMP e
WHERE e.sal*12 = 36000;

-- 급여가 3000이상인 사원 조회
SELECT *
FROM EMP e
WHERE e.sal >= 3000;

-- 급여가 2500 이상이고 직업이 ANALYST 사원 조회
SELECT *
FROM emp e
WHERE e.sal >= 2500 AND e.job = 'ANALYST';

-- 문자 대소 비교
-- 사원명의 첫 문자가 F와 같거나 F보다 뒤에 있는 사원조회
SELECT *
FROM EMP e 
WHERE e.ename >= 'F';

-- 급여가 3000이 아닌 사원 조회
SELECT *
FROM EMP e
WHERE e.sal !=3000;

SELECT *
FROM EMP e 
WHERE e.sal <> 3000;

SELECT *
FROM Emp e
WHERE e.sal ^= 3000;

SELECT *
FROM emp e
WHERE NOT e.sal NOT = 3000;

-- job이 MANAGER 이거나, SALESMAN 이거나, CLERK 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB = 'MANAGER'
	OR e.JOB ='SALESMAN'
	OR e.JOB ='CLERK';  
-- IN 연산자로 변경
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB IN ('MANAGER','SALESMAN','CLERK');

SELECT
	*
FROM
	EMP E
WHERE
	e,JOB NOT IN 
	
	
	
-- BETWEEN A AND B
-- 급여 2000 이상 3000이하
	SELECT * FROM EMP e WHERE E.SAL >= 2000 AND E.SAL <=3000; 

	SELECT * FROM EMP e WHERE E.SAL BETWEEN 2000 AND 3000; 

-- 급여 2000 이상 3000이하가 아닌 사원 조회
	SELECT * FROM EMP e WHERE E.SAL NOT BETWEEN 2000 AND 3000; 

-- LIKE : 검색
-- _ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자열 데이터를 의미

-- 사원명이 S 로 시작하는 사원 조회
SELECT * FROM EMP E WHERE E.Ename LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회
SELECT * FROM EMP E WHERE E.Ename LIKE '_L%'

-- 사원명에 AM 이 포함된 사원 조회
SELECT * FROM EMP E WHERE E.Ename LIKE '_AM%'

-- 사원명에 AM 이 포함하지 않은 사원 조회
SELECT * FROM EMP E WHERE E.Ename NOT LIKE '_AM%'

-- IS NULL
-- COMM이 NULL 인 사원 조회
SELECT * 
FROM EMP e
WHERE E.COMM IS NULL;
-- MGR이 NULL 인 사원 조회
SELECT * 
FROM EMP e
WHERE E.MGR IS NULL;

-- 직속 상관이 있는 사원 조회
SELECT * 
FROM EMP e
WHERE E.MGR IS NOT NULL;







