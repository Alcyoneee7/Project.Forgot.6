select * 
from AeonianCentral..sales



--1 top customer from quantity and price 
--2 order date frequency 
--3 status currently
--4 most popular productline
--5 which country deal with us most
--6 contact frequency top
--7 most frequency deal size


--1
select customername, (PRICEEACH * QUANTITYORDERED) as lala , sales
from AeonianCentral..sales
order by CUSTOMERNAME


--!
select distinct CustomerName,  sum (PRICEEACH * QUANTITYORDERED) as Revenue ,count(customername) as Frequency
from AeonianCentral..sales
group by customername
order by Revenue desc


--2
select orderdate, convert(date,orderdate)
from AeonianCentral..sales

update AeonianCentral..sales
set ORDERdate=  convert(date,orderdate)

alter table aeoniancentral..sales
add OrderTime Date

update AeonianCentral..sales
set ORDERtime =  convert(date,orderdate)

--!
select QUANTITYORDERED as Sales  , ordertime as [Date]
from AeonianCentral..Sales
order by ordertime




--3
select * 
from AeonianCentral..sales

--!
select distinct Status, count(status) as Count
from AeonianCentral..sales
group by status
order by count desc



--4
--!
select distinct PRODUCTLINE as[ Product], sum(quantityordered)as [Quantity Ordered], sum(QUANTITYORDERED * PRICEEACH) as Revenue
from AeonianCentral..sales
group by PRODUCTLINE
order by 2 desc


--5
--!
select distinct Country, count(country) as Frequency , sum(QUANTITYORDERED * PRICEEACH) as Revenue
from AeonianCentral..sales
group by country
order by Frequency desc



select * 
from AeonianCentral..sales

--6
--!
select distinct Contact , sum(sales) as Revenue , count(contact) as Deal
from AeonianCentral..sales
group by contact
order by  deal desc

--7
--!
select distinct Dealsize, count(dealsize) as Category
from AeonianCentral..sales
group by dealsize
order by Category desc
