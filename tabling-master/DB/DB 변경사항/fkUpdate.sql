ALTER TABLE access_Token DROP CONSTRAINT access_Token_user_email_FK CASCADE;
ALTER TABLE access_Token ADD CONSTRAINT access_Token_user_email_FK FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;

ALTER TABLE take_out DROP CONSTRAINT take_out_user_email_FK CASCADE;
ALTER TABLE take_out ADD CONSTRAINT take_out_user_email_FK FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;

ALTER TABLE reservation DROP CONSTRAINT reservation_user_email_FK CASCADE;
ALTER TABLE reservation ADD CONSTRAINT reservation_user_email_FK FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;

ALTER TABLE jjim_review DROP CONSTRAINT jjim_review_user_email_FK CASCADE;
ALTER TABLE jjim_review ADD CONSTRAINT jjim_review_user_email_FK FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;

ALTER TABLE waiting DROP CONSTRAINT waiting_user_email_kf CASCADE;
ALTER TABLE waiting ADD CONSTRAINT waiting_user_email_kf FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;

ALTER TABLE jjim_sch DROP CONSTRAINT jjim_sch_user_email_FK CASCADE;
ALTER TABLE jjim_sch ADD CONSTRAINT jjim_sch_user_email_FK FOREIGN KEY(user_email)
REFERENCES jjim_user(user_email) on delete cascade;