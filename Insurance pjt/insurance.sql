create table staff_tbl(
sno varchar2(4) not null,
sname varchar2(20) not null,
spass varchar2(4) not null,
bcd varchar2(4) not null,
srank varchar2(10) not null,
PRIMARY KEY(sno));

insert INTO staff_tbl values('1385','�ε鷹','1234','20','����');
insert INTO staff_tbl values('1001','����1','pwd1','10','����');
insert INTO staff_tbl values('1002','����2','pwd2','10','����');
insert INTO staff_tbl values('1003','����3','pwd3','20','����');
insert INTO staff_tbl values('1004','����4','pwd4','20','����');
insert INTO staff_tbl values('1005','����5','pwd5','10','����');
insert INTO staff_tbl values('1006','����6','pwd6','10','����');
insert INTO staff_tbl values('1007','����7','pwd7','20','����');
insert INTO staff_tbl values('1008','����8','pwd8','20','����');

create table bu_tbl(
bcd varchar2(4) not null,
bname varchar2(20) not null,
PRIMARY KEY (bcd));

insert into bu_tbl values('10','ȭ�纸���');
insert into bu_tbl values('20','�������');

create table ins_tbl(
ino varchar2(5) not null,
iname varchar2(20) not null,
iamount NUMBER(10) default 0,
sno varchar2(20) not null,
idate date default sysdate,
PRIMARY key(ino));

drop table ins_tbl;

insert into ins_tbl values('AD101','��1',10000000,'1001','19/12/01');
insert into ins_tbl values('AD102','��2',22000000,'1002','19/12/03');
insert into ins_tbl values('AD201','��3',15000000,'1003','19/12/11');
insert into ins_tbl values('AD202','��4',24000000,'1008','19/12/12');
insert into ins_tbl values('AD203','��5',12000000,'1005','19/12/12');
insert into ins_tbl values('AD301','��6',5000000,'1008','19/12/01');
insert into ins_tbl values('AD302','��7',6000000,'1004','19/12/03');
insert into ins_tbl values('AD401','��2',33000000,'1008','19/12/11');
insert into ins_tbl values('AD402','��4',16000000,'1006','19/12/12');
insert into ins_tbl values('AD403','��1',8000000,'1007','19/12/12');


commit;

select * from staff_tbl where sno= '1001' and spass='pwd1';
select ino,iname,to_char(iamount,'999,999,999'),sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl;
select ino,iamount,sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl where iname='��';

select * from staff_tbl natural join ins_tbl where sum(iamount)= max(sum(iamount)) ; 

select *
from staff_tbl natural join ins_tbl natural join bu_tbl;

select bname,srank,sname,sum(iamount)--���� ������� �׷����� ������°��̹Ƿ� group by�� ���Ե����ʴ´�.
from staff_tbl natural join ins_tbl natural join bu_tbl
group by sname,srank,bname
having sum(iamount) = (select max(sum(iamount))
                        from staff_tbl natural join ins_tbl natural join bu_tbl
                        group by sname);



select bname,srank,sname,max(sum(iamount)) from ins_tbl natural join staff_tbl NATURAL join bu_tbl group by sno;

--������ ��½� �޸� ���������
SELECT  TO_CHAR( num_col , '999,999,999,999,999')
FROM  TEMP

--�Ѱ��ݾ�

max()