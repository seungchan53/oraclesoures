-- board 테이블 작성
CREATE TABLE board(
	bno NUMBER(8) PRIMARY KEY,
	title varchar2(100) NOT NULL,
	content varchar2(2000) NOT NULL,
	writer varchar2(50) NOT NULL,
	regdate DATE DEFAULT sysdate
) 

CREATE SEQUENCE board_seq;

INSERT INTO board(bno,title,content,writer);
VALUES(board_seq.nextval,'title1','content1','user1');


INSERT INTO STUDENTTBL(name) VALUES('홍길동');
INSERT INTO STUDENTTBL(name) VALUES('성춘향');

select
        t1_0.team_id,
        t1_0.team_name
    from
        team t1_0
    WHERE
    	team t1_0 =?;
   
--
select
      * 
    FROM
    	team t1_0 
    left join
        team_member tm1_0  
            on t1_0.team_id=tm1_0.team_id 
    where
        tm1_0.member_id=1;

-- todo 완료 목록
SELECT * FROM TODO t WHERE t.completed = 1;
-- todo 미완료 목록
SELECT * FROM TODO t WHERE t.completed = 0;
-- todo 중요 목록
SELECT * FROM TODO t WHERE t.IMPORTANTENT  = 1;

-- JPA_ITEM 테이블
-- 집계함수 : sum, count, avg, max, min
-- sum, avg, max, min : price
-- count : 아이템 개수

SELECT COUNT(*), SUM(ji.price), avg(ji.price), max(ji.price), miN(ji.price) 
FROM JPA_ITEM ji;

-- Team, TeamMember

SELECT
FROM TEAM_MEMBER tm JOIN team t ON tm.TEAM_ID = t.TEAM_ID
WHERE tm.TEAM_ID = 2

--
SELECT
FROM ORDERS o 
JOIN MART_MEMBER mm ON 
o.MEMBER_ID = mm.ID JOIN ORDER_ITEM oi ON o.ORDER_ID = oi.ORDER_ID

-- 동일한 주문 번호에 주문한 상품의 총 개수, 상태, 주문 내역 조회
SELECT oi.ORDER_ID, count(oi.ORDER_ID) AS cnt
FROM ORDER_ITEM oi 
GROUP BY oi.ORDER_ID

-- ORDER_ITEM + ORDERS
-- oi.ORDER_ID, count(oi.ORDER_ID) AS cnt, ORDER_STATUS
SELECT
	o.ORDER_ID AS oid
	count(o.ORDER_ID) AS cnt
FROM
	ORDERS o
LEFT JOIN (
	SELECT 
		oi.ORDER_ID AS oid,
		count(oi.ORDER_id) AS cnt
	FROM 
		ORDER_ITEM oi
	GROUP BY
		oi.order_id) a ON
	o.ORDER_ID = a.oid
	
-- select 절
SELECT
	o.ORDER_ID,
	o.ORDER_STATUS,
	(SELECT
		count(oi.ORDER_id)
FROM
	ORDER_item oi
WHERE o.ORDER_id = oi.ORDER_id
	GROUP BY
		oi.ORDER_id) AS cnt
FROM
	orders o;

-- 더미 데이터
INSERT INTO BOOKTBL(PRICE,AUTHOR,CREATED_DATE,TITLE,UPDATED_DATE)
(SELECT PRICE,AUTHOR,CREATED_DATE,TITLE,UPDATED_DATE FROM BOOKTBL b)

SELECT count(+) FROM BOOKTBL b;

-- board 조회
-- bno title, reply 개수, createDate
SELECT b.bno, b.TITLE, b.CREATED_DATE 
FROM BOARDTBL b 

SELECT r.BOARD_ID, count(r.RNO)
FROM REPLY r 
GROUP BY r.BOARD_ID;


SELECT
	b.bno,
	b.TITLE,
	(
	SELECT
		count(r.RNO)
	FROM
		REPLY r
	WHERE
		r.board_id = b.BNO
	GROUP BY
		r.BOARD_ID) AS reply_cnt,
	b.CREATED_DATE,
	m.NAME
FROM
	BOARDTBL b JOIN BOARDMEMBER m ON b.MEMBER_ID = m.EMAIL
	
SELECT
	board,
	member1,
	(
	SELECT
		count(reply.rno)
	FROM
		Reply reply
	WHERE
		reply.board = board)
FROM
	Board board
LEFT JOIN MEMBER member1 WITH board.member = member1

-- 1번 게시물에 달려있는 댓글 전체 가져오기
SELECT * FROM REPLY r WHERE BOARD_ID = 1;



-- 영화 이미지 추출
SELECT
	mi.*,
	m.*,
	(
	SELECT
		count(r.RNO)
	FROM
		REVIEW r
	WHERE
		r.MOVIE_MNO = mi.MOVIE_MNO ) AS cnt,
	(
	SELECT
		avg(r.GRADE)
	FROM
		REVIEW r
	WHERE
		r.MOVIE_MNO = mi.MOVIE_MNO ) AS avg
FROM
	movie_image mi
LEFT JOIN MOVIE m ON
	mi.MOVIE_MNO = m.MNO
WHERE
	mi.inum IN (
	SELECT
		min(mi.INUM)
	FROM
		MOVIE_IMAGE mi
	GROUP BY
		mi.MOVIE_MNO)
-- path 정보 찾기
		
		
SELECT 
	m.title,
	(
	SELECT 
		count(r.RNO),
	FROM 
		REVIEW r
	WHERE
		r.MOVIE_MNO = mi.MOVIE_MNO ) AS review_cnt,
		(
		SELECT 
			avg(r.grade),
		FROM
			REVIEW r 
		WHERE 
			r.MOVIE_MNO  = mi.MOVIE_MNO) AS avg,
			mi.IMG_NAME
	FROM
		MOVIE_IMAGE mi
	LEFT JOIN MOVIE m ON
		m.MNO  = mi.MOVIE_MNO
	WHERE mi.MOVIE_MNO = 2;


-- 리뷰 조회
-- movie_mno=2
SELECT * FROM REVIEW r WHERE r.MOVIE_MNO = 69;


SELECT
	*
FROM
	MOVIE_IMAGE mi
WHERE
	mi.path = to_char(sysdate, 'yyyy\\mm\\dd')
	
	



