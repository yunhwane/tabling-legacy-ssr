ALTER TABLE RESTAURANT MODIFY (res_img VARCHAR2(2000));
ALTER TABLE menu MODIFY (food_image VARCHAR2(4000));

SELECT * FROM menu;

UPDATE RESTAURANT x
	SET x.RES_IMG='https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcyKT9k%2FbtrjKtxmRwN%2FsYL1DdGs0Bb3Hb3nWjlr1K%2Fimg.jpg'
	WHERE x.RESNUM='123-45-67890';
UPDATE RESTAURANT x
	SET x.RES_IMG='https://lh3.googleusercontent.com/p/AF1QipNIemL0WxL9rW9SmF6C3_-_2EAj8jARX9Rs7ctt=s1360-w1360-h1020'
	WHERE x.RESNUM='123-45-67895';
UPDATE RESTAURANT x
	SET x.RES_IMG='https://d12zq4w4guyljn.cloudfront.net/750_750_20200923113923_photo2_ebA8OToEL5QH.jpg'
	WHERE x.RESNUM='123-45-67894';
UPDATE RESTAURANT x
	SET x.RES_IMG='https://pbs.twimg.com/media/DnMVzuCVAAAD_G3.jpg:large'
	WHERE x.RESNUM='123-45-67893';
UPDATE RESTAURANT x
	SET x.RES_IMG='https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Gamja-tang_5.jpg/1200px-Gamja-tang_5.jpg'
	WHERE x.RESNUM='123-45-67892';
UPDATE RESTAURANT x
	SET x.RES_IMG='https://blog.kakaocdn.net/dn/c9Q7Il/btqImcrR7mz/5VpU7Lh6IeI9xZJF4itnP0/img.png'
	WHERE x.RESNUM='123-45-67891';
	


UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/yeondon01.jpg@/index_markup/img/yeondon02.jpg@/index_markup/img/yeondon03.jpg'
	WHERE x.RESNUM='123-45-67890';
UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/bagle01.jpg@/index_markup/img/bagle02.jpg@/index_markup/img/bagle03.jpg'
	WHERE x.RESNUM='123-45-67895';
UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/dowon01.jpg@/index_markup/img/dowon02.jpg@/index_markup/img/dowon03.jpg'
	WHERE x.RESNUM='123-45-67894';
UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/heajang01.jpg@/index_markup/img/heajang02.jpg@/index_markup/img/heajang03.jpg'
	WHERE x.RESNUM='123-45-67893';
UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/gamzatang01.jpg@/index_markup/img/gamzatang02.jpg@/index_markup/img/gamzatang03.jpg'
	WHERE x.RESNUM='123-45-67892';
UPDATE menu x
	SET x.FOOD_IMAGE ='/index_markup/img/yeondon01.jpg@/index_markup/img/yeondon02.jpg@/index_markup/img/yeondon03.jpg'
	WHERE x.RESNUM='123-45-67891';
	
SELECT * FROM menu;