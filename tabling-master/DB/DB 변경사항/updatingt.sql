DELETE 
FROM WAITING
WHERE resnum = '123-45-67890';

INSERT INTO WAITING VALUES('123-45-67890','ljw123@naver.com',
to_date('2023-01-05 15:00','YYYY-MM-DD HH24:MI'),0,4,'F','F');
INSERT INTO WAITING VALUES('123-45-67890','hjw123@naver.com',
to_date('2023-01-05 15:30','YYYY-MM-DD HH24:MI'),0,3,'F','F');
INSERT INTO WAITING VALUES('123-45-67890','jyh123@naver.com',
to_date('2023-01-05 16:00','YYYY-MM-DD HH24:MI'),0,2,'F','F');
