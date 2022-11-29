SELECT * FROM shark_tank_dataas.`new data  (1)`;

-- total episodes
USE shark_tank_dataas;
select distinct'Ep. No.' from  `new data  (1)`;

-- count total no of episode

select count(distinct'Ep. No.') from  `new data  (1)`;

-- Max number of episode

select max(distinct'Ep. No.') from  `new data  (1)`;

-- count brand

select count(distinct brand) from  `new data  (1)`;

-- no of pitches got funding

select 'AmountInvested lakhs' , case when 'AmountInvested lakhs'>0 then 1 else 0 end as 'converted_not_converted' from `new data  (1)`;

-- sum of pitches converted

select sum('converted_not_converted'),count(*) from `new data  (1)`;

-- pitches converted percentage

select cast(sum( a.converted_not_converted) as float )  /cast(count(*) as float) from (
select 'AmountInvested lakhs' , case when 'AmountInvested lakhs'>0 then 1 else 0 end as 'converted_not_converted' from `new data  (1)`) a;

-- total male --

select sum(male) from `new data  (1)`;

-- total female --
select sum(female) from `new data  (1)`;

-- gender ratio

select sum(male)/sum(female) from `new data  (1)`;
select sum(female)/sum(male) from `new data  (1)`;

-- total invested amount

select sum('AmountInvested lakhs') from `new data  (1)`;

-- average equity taken by the sharks

select avg('a.Equity Taken %' ) from (SELECT 'Equity Taken %' from `new data  (1)` where 'Equity Taken %'>0) a;

-- highest deal taken

select max('AmountInvested lakhs') from `new data  (1)`;

-- highest equity taken

select max('Equity Taken %') from `new data  (1)`;

-- atleast 1 female

select female,case when female>0 then 1 else 0 end as female_count from `new data  (1)` a; 

select sum(a.female_count) from (select female,case when female>0 then 1 else 0 end as female_count from `new data  (1)` )a;

-- pitches converted having atleast one 1 women.

select * from `new data  (1)` where deal!='No Deal';

select sum(b.female_count) from(
select case when a.female>0 then 1 else 0 end as female_count,a.*from(
(select * from `new data  (1)`where deal!='No Deal')) a)b;

SELECT * FROM shark_tank WHERE Female>0 AND DEAL!="NO DEAL";

-- avg teammembers

select avg('Team members') from `new data  (1)`;

--  amount invested per deal

select avg('a.AmountInvested lakhs') amount_invested_per_deal from (select * from `new data  (1)` where deal!='No Deal') a;

-- avg age group of contestants

select avgage,count(avgage) cnt from `new data  (1)` group by avgage order by cnt desc;

-- location group of contestants

select location,count('Location') cnt from `new data  (1)` group by location order by cnt desc;
select location,count('Location') cnt from `new data  (1)` group by location order by cnt asc;

--- sector group of contestants

select sector,count('Sector') cnt from `new data  (1)` group by sector order by cnt desc;
select sector,count('Sector') cnt from `new data  (1)` group by sector order by cnt asc;


--- making the metrics









------ which is the startup in which the highest amount has been invested in each domain/sector

select c.* from 
(select 'Brand','Sector','Amount Invested lakhs',rank() over(partition by sector order by 'Amount Invested lakhs' desc) rnk 

from `new data  (1)`) c

where c.rnk=1















