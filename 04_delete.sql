-- DELETE문
-- DML중 하나로 저장되어 있는 기존 데이터를 삭제하기 위해 사용하는 쿼리 

-- DELETE FROM 테이블명
-- [WHERE 조건];

delete from title_emps
WHERE
	emp_id= 100007 
;

delete from employees
WHERE
	emp_id >100000
;