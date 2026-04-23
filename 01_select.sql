-- SELECT문
-- DML 중 하나로, 저장되어 있는 데이터를 
-- 조회하기위해 사용하는 쿼리

-- 조회한 데이터 중 특정 컬럼만 출력 
-- `(백틱)으로 감싸면 컬럼으로써, 인식시킨다 라는 의미 name은 예약어 
SELECT 
	emp_id
	,`name`
	, gender 
FROM employees;

-- 테이블 전체 컬럼 조회 : *(Asterisk)
SELECT *
FROM employees;

-- WHERE 절 : 특정 컬럼의 값이 일치한 데이터만 조회 
SELECT *
FROM employees
WHERE emp_id = 10009;

SELECT *
FROM employees
WHERE `name` = '도진희';

SELECT * 
FROM employees
WHERE birth >= '1990-01-01';

SELECT * 
FROM employees
WHERE fire_at IS NOT NULL;


-- 출생년도가 1990년인 사원을 출력해주세요.
SELECT * 
FROM employees
WHERE 
	birth BETWEEN '1990-01-01' AND '1990-12-31';

SELECT *
FROM employees 
WHERE 
		 birth >= '1990-01-01'
	AND birth <= '1990-12-31'
	AND gender = 'M';

-- 이름이 '김철수' 또는 '정유리'인 사원을 조회해주세요.
SELECT *
FROM employees
WHERE 
		`name` = '조은혜'
		OR `name` = '정유리';


SELECT * 
FROM employees
WHERE `name` IN ('조은혜','정유리');



-- 1990년 출생이거나, 이름이 '정유리'인 사원을 출력해 주세요.
SELECT * 
FROM employees
WHERE 
		( 
				 birth >= '1990-01-01'
			AND birth <= '1990-12-31'
		)
		OR `name`= '정유리';


-- BETWEEN 연산자 : 지정한 범위 내의 데이터를 조회
SELECT * 
FROM employees 
WHERE 
	birth BETWEEN '1990-01-01' AND '1990-12-31'
	AND `name` = '정유리';


-- 사원번호가 10005, 10010인 사원을 조회해 주세요 
SELECT * 
FROM employees
WHERE emp_id = 10005 OR emp_id = 10010;

-- IN 연산자 : 다수의 지정한 값과 일치하는 데이터 조회 
SELECT * 
FROM employees 
WHERE emp_id IN (10005,10010);

-- LIKE절 : 문자열의 내용을 조회
-- %: 글자수와 상관없이 조회할 경우 사용 
-- 이름이 '우'로 끝나는 사원 조회 
SELECT * 
FROM employees 
WHERE 
	`name` LIKE '%우';

-- 이름에 '우'가 포함 되어 있는 사원 조회 
SELECT * 
FROM employees 
WHERE 
	`name` LIKE '%우%';

-- 이름이 '우'로 시작하는사원 조회 
SELECT * 
FROM employees 
WHERE 
	`name` LIKE '우%';
	
-- _: 언더바의 개수만큼 글자수를 허용해서 조회 
SELECT * 
FROM employees 
WHERE 
	`name` LIKE '__우_';

-- ORDER BY절 : 데이터를 정렬 
-- ASC(default): 오름차순/ DESC: 내림차순
SELECT * 
FROM employees
ORDER BY `name`, birth DESC
;

-- LIMIT 키워드, OFFSET 키워드 
-- 출력 개수를 제한 
-- 사번 오름차순으로 정렬된 상위 10명 조회 
SELECT * 
FROM employees
ORDER BY emp_id
-- LIMIT 10 OFFSET 20 아래와 같음 
LIMIT 20, 10
;

-- 집계함수 
-- SUM(컬럼) : 해당컬럼의 합계를 출력
-- MAX(컬럼) : 해당 컬럼의 값중 최대값을 출력 
-- MIN(컬럼) : 해당 컬럼의 값중 최소값을 출력
-- AVG(컬럼) : 해당 컬럼의 평균을 출력 
SELECT 
	 SUM(salary)  sum_sal
	,MAX(salary) AS max_sal
	,MIN(salary) AS min_sal
	,AVG(salary) AS avg_sal
FROM salaries
WHERE 
	end_at IS NULL
;


-- COUNT(컬럼 || *) : 검색 결과의 총 레코드 수를 출력 
-- * : 총 레코드 수를 반환
-- 컬럼명 : 검색 결과 중, 해당 컬럼의 값이 NULL이 아닌 레코드의 총 수를 출력
SELECT 
	COUNT(*)
FROM employees
; 

SELECT 
	COUNT(fire_at)
FROM employees
; 

-- 현재 받고있는 급여 중,
-- 가장 많이 받는 급여와, 가장 적게 받는 급여 출력
SELECT 
	 MAX(salary)
	,MIN(salary)
FROM salaries 
WHERE 
	end_at IS NULL
;

-- DISTINCT 키워드 : 검색결과에서 중복되는 레코드 없이 조회 
SELECT DISTINCT 
	emp_id
FROM salaries
;

-- GROUP BY절, HAVING절 
-- 그룹으로 묶어서 조회 
-- 직책별 사원수 
SELECT 
	-- SELECT절에 작성하는 컬럼은
	-- GROUP BY절에서 사용한 컬럼과 
	-- 집계함수만 작성 (표준 문법)
	 title_code
	,COUNT(*) AS cnt
FROM title_emps
WHERE 
	end_at IS NULL
GROUP BY title_code
;

-- 직책별 사원수 중, 10000명 이상인 직책의 사원수 출력
SELECT 
	 title_code
	,COUNT(*) AS cnt 
FROM title_emps
WHERE 
	end_at IS NULL 
GROUP BY title_code
HAVING cnt>10000
;


























