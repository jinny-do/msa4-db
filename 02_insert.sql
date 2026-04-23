-- INSERT문 
-- DML 중 하나로 신규 데이터를 저장하기 위해 사용하는 쿼리 
-- INSERT INTO 테이블명 [(컬럼1, 컬럼2...title_emp_id)]
-- VALUES(값1, 값2...title_emp_id);

INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
)
VALUES (
	'도진희'
	,'2003-07-15'
	,'F'
	,NOW() -- 현재 시간 자동으로 들어감 
	,NULL 
	,NULL 
	,NOW()
	,NOW() 
),(
	 '도나인'
	,'2005-02-22'
	,'F'
	,NOW()
	,null
	,null
	,NOW()
	,NOW()
);

-- SELECT INSERT문 
INSERT INTO title_emps (
	emp_id,
	title_code,
	start_at,
	end_at,
	created_at,
	updated_at,
	deleted_at
)
SELECT
	MAX(emp_id),
	'T001',title_emps
	NOW(),
	NULL,
	NOW(),
	NOW(),
	NULL
FROM employees
;















