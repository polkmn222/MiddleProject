CREATE TABLE ujuser(
	 
    uid 	VARCHAR(10) NOT NULL  PRIMARY KEY,
    pwd 	VARCHAR(16) NOT NULL ,
    name 	VARCHAR(10) NOT NULL,
    phone	VARCHAR(14) NOT NULL,
    address VARCHAR(50) NOT NULL,
    root	VARCHAR(20)
);
SELECT * FROM BOARD;

ALTER TABLE ujuser ADD email VARCHAR(30);

SELECT * FROM ujuser;
DESC ujuser;
DROP TABLE ujuser;

 SELECT uid, pwd, name, phone, address, root
        FROM ujuser
        where uid = "smith";

UPDATE ujuser 
       SET phone="010-1234-5678",
       pwd = "1234"
       WHERE uid="smith";
  
  CREATE TABLE ujboard(
	 
    num 	INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title 	VARCHAR(16) NOT NULL ,
    author 	VARCHAR(10) NOT NULL REFERENCES ujuser(uid),
    contents VARCHAR(2000),
    bdate 	DATE
);     
SELECT * FROM ujboard;
DESC ujboard;
 CREATE TABLE ujattach(
	 
    att_num 	INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    board_num 	INT(10),
    filename 	VARCHAR(4000),
    filesize 	INT(10)
);
SELECT * FROM ujATTACH;
SELECT COUNT(*) FROM ujBOARD;



SET @ROWNUM:=0;
SELECT @ROWNUM:=@ROWNUM+1, A.*
FROM ujboard A
;

SELECT @ROWNUM:=@ROWNUM+1, A.*
FROM ujboard A, (SELECT @ROWNUM:=0) R
WHERE R BETWEEN 1 AND 5;

DESC ujATTACH;

SELECT *
FROM ujboard
ORDER BY num DESC
LIMIT 1, 5;

SET @ROWNUM:=0;
SELECT * 
      FROM (
         
         SELECT @rownum:=@rownum+1 rn, A.* 
            FROM (
                  SELECT * 
                  FROM ujBOARD, 
                  (SELECT @ROWNUM:=0) t
                  ORDER BY num DESC 
                  ) A
            ) B
           
   WHERE RN BETWEEN 1 AND 5;

SELECT * FROM 
(
SELECT *, @ROWNUM:=@ROWNUM+1 RN FROM ujboard, (SELECT @ROWNUM:=0)   
) t 
WHERE RN =3;
CREATE TABLE ujrt(
	 
    rnum 	INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rinfo	VARCHAR(50) NOT NULL,
    rp		INT(10) NOT NULL,
    ruid 	VARCHAR(10) NOT NULL,
    rtime 	VARCHAR(30)
); 
ALTER TABLE UJRT ADD rtotal INT(10);
ALTER TABLE UJRT DROP rtotal;
DESC UJRT;
SELECT * FROM UJRT;
DROP TABLE UJRT;
INSERT INTO ujrt VALUES(0,"토요일",2,"smith5","런치");

SELECT rinfo, rp, rtime
FROM UJRT;

SELECT rinfo, SUM(rp), rtime
FROM UJRT
WHERE rinfo = "2022-04-11";

SELECT rinfo, SUM(rp), rtime
FROM UJRT;

SELECT rinfo, SUM(rp) AS rp, rtime
        FROM ujrt
      Group BY rinfo, rtime;
      
SELECT *
        FROM ujrt
        WHERE ruid = "smith5";   
        
SELECT * FROM
UJRT
ORDER BY RINFO DESC; 

SELECT * 
      FROM (
         
         SELECT @rownum:=@rownum+1 rn, A.* 
            FROM (
                  SELECT * 
                  FROM ujrt, 
                  (SELECT @ROWNUM:=0) t
                  ORDER BY rinfo DESC 
                  ) A
            ) B
           
  		 WHERE RN BETWEEN 1 AND 3;       

		SELECT *
        FROM ujrt
        WHERE ruid ="smith5";
        
INSERT INTO ujrt VALUES(0,"2022-04-13",2,"smith5","런치 : 13시05분", SUM(rp));

ALTER TABLE UJRT ADD rtotal INT(10);
ALTER TABLE UJRT DROP rtotal;
DESC UJRT;
SELECT * FROM UJRT;

UPDATE UJRT 
SET rtotal = rtotal +1
WHERE rinfo = "2022-04-13" AND rtime = "런치 : 13시05분";