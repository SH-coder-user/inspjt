create table staff_tbl(
sno varchar2(4) not null,
sname varchar2(20) not null,
spass varchar2(4) not null,
bcd varchar2(4) not null,
srank varchar2(10) not null,
PRIMARY KEY(sno));

insert INTO staff_tbl values('1385','민들레','1234','20','부장');
insert INTO staff_tbl values('1001','직원1','pwd1','10','부장');
insert INTO staff_tbl values('1002','직원2','pwd2','10','과장');
insert INTO staff_tbl values('1003','직원3','pwd3','20','부장');
insert INTO staff_tbl values('1004','직원4','pwd4','20','과장');
insert INTO staff_tbl values('1005','직원5','pwd5','10','부장');
insert INTO staff_tbl values('1006','직원6','pwd6','10','과장');
insert INTO staff_tbl values('1007','직원7','pwd7','20','부장');
insert INTO staff_tbl values('1008','직원8','pwd8','20','과장');

create table bu_tbl(
bcd varchar2(4) not null,
bname varchar2(20) not null,
PRIMARY KEY (bcd));

insert into bu_tbl values('10','화재보험부');
insert into bu_tbl values('20','생명보험부');

create table ins_tbl(
ino varchar2(5) not null,
iname varchar2(20) not null,
iamount NUMBER(10) default 0,
sno varchar2(20) not null,
idate date default sysdate,
PRIMARY key(ino));

drop table ins_tbl;

insert into ins_tbl values('AD101','고객1',10000000,'1001','19/12/01');
insert into ins_tbl values('AD102','고객2',22000000,'1002','19/12/03');
insert into ins_tbl values('AD201','고객3',15000000,'1003','19/12/11');
insert into ins_tbl values('AD202','고객4',24000000,'1008','19/12/12');
insert into ins_tbl values('AD203','고객5',12000000,'1005','19/12/12');
insert into ins_tbl values('AD301','고객6',5000000,'1008','19/12/01');
insert into ins_tbl values('AD302','고객7',6000000,'1004','19/12/03');
insert into ins_tbl values('AD401','고객2',33000000,'1008','19/12/11');
insert into ins_tbl values('AD402','고객4',16000000,'1006','19/12/12');
insert into ins_tbl values('AD403','고객1',8000000,'1007','19/12/12');


commit;

select * from staff_tbl where sno= '1001' and spass='pwd1';
select ino,iname,to_char(iamount,'999,999,999'),sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl;
select ino,iamount,sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl where iname='고객';

select * from staff_tbl natural join ins_tbl where sum(iamount)= max(sum(iamount)) ; 

select *
from staff_tbl natural join ins_tbl natural join bu_tbl;

select bname,srank,sname,sum(iamount)--나온 결과들을 그룹으로 묶어놓는것이므로 group by에 포함되지않는다.
from staff_tbl natural join ins_tbl natural join bu_tbl
group by sname,srank,bname
having sum(iamount) = (select max(sum(iamount))
                        from staff_tbl natural join ins_tbl natural join bu_tbl
                        group by sname);



select bname,srank,sname,max(sum(iamount)) from ins_tbl natural join staff_tbl NATURAL join bu_tbl group by sno;

--원단위 출력시 콤마 찍는쿼리문
SELECT  TO_CHAR( num_col , '999,999,999,999,999')
FROM  TEMP

--총계약금액

max()