CREATE TABLE jjim_sch(
	id varchar2(30) CONSTRAINT jjim_sch_id_FK REFERENCES jjim_user(id),
	search_word varchar2(100),
	search_date date
);