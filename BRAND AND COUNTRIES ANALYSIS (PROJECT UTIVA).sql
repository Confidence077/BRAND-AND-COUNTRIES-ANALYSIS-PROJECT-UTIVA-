select *
from "confi-data";

QUESTION 1
Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries
---ANSWER---

select "BRANDS", "YEARS", sum("PROFIT") as "Total_Profit"
from "confi-data"
where "COUNTRIES" like '%Togo%'
group by "BRANDS", "YEARS"
order by "Total_Profit" DESC
LIMIT 3;


QUESTION 2
Find out the top two choice of consumer brands in Ghana
---ANSWER---

select "BRANDS", "COUNTRIES",  sum("QUANTITY") as "Total_qty"
from "confi-data"
where "COUNTRIES" like '%Ghana%'
group by "BRANDS", "COUNTRIES"
order by "Total_qty" DESC
limit 2;

select distinct "COUNTRIES"
from "confi-data";

QUESTION 3
Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.
----ANSWER---

--FOR NIGERIA--
select "COUNTRIES", "BRANDS", sum("QUANTITY") as "total_quantity"
from "confi-data"
--where "COUNTRIES" like 'Nigeria'
where "BRANDS" not like '%malt%'
and "COUNTRIES" not in ('Togo', 'Ghana', 'Senegal', 'Benin')
group by "COUNTRIES","BRANDS" 
order by "total_quantity" desc;

--FOR GHANA--
select distinct("BRANDS"), "COUNTRIES", sum("QUANTITY") as "Total_qty"
from "confi-data"
where "BRANDS" not like '%malt%' 
and "COUNTRIES" not in ('Nigeria', 'Togo', 'Benin', 'Senegal')
group by "BRANDS", "COUNTRIES"
order by "Total_qty" desc;


QUESTION 4
Favorites malt brand in Anglophone region between 2018 and 2019
--ANSWER--

select "BRANDS", "YEARS", sum("QUANTITY") as "Sum_qty"
from "confi-data"
where "BRANDS" like '%malt%' and "COUNTRIES" in ('Nigeria', 'Ghana') and "YEARS" = 2018
group by "BRANDS", "YEARS"
order by "Sum_qty" desc;

select "BRANDS", "YEARS", sum("QUANTITY") as "Sum_qty"
from "confi-data"
where "BRANDS" like '%malt%' and "COUNTRIES" in ('Nigeria', 'Ghana') and "YEARS" = 2019
group by "BRANDS", "YEARS"
order by "Sum_qty" desc;

QUESTION 5
Which brands sold the highest in 2019 in Nigeria?
---ANSWER---

select "BRANDS", "YEARS", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "COUNTRIES" like '%Nigeria%' and "YEARS" = 2019
group by "BRANDS", "YEARS"
order by "Total-quantity" desc;

QUESTION 6
Favorites brand in South_South region in Nigeria

select "REGION"
from "confi-data";

---ANSWER---
select "COUNTRIES", "REGION", "BRANDS", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "COUNTRIES" like '%Nigeria%'
group by "BRANDS", "REGION"
order by "Total-quantity" desc;

QUESTION 7
Bear consumption in Nigera

---ANSWER---
select "BRANDS", "COUNTRIES", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "BRANDS" not like '%malt%' and "COUNTRIES" in ('Nigeria')
group by "BRANDS", "COUNTRIES"
order by "Total-quantity" desc;

QUESTION 8
Level of consumption of Budweiser in the regions in Nigeria

---ANSWER---
select "BRANDS", "COUNTRIES", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "BRANDS" like '%budweiser%' and "COUNTRIES" in ('Nigeria')
group by "BRANDS", "COUNTRIES" 
order by "Total-quantity" desc;

COUNTRIES ANALYSIS

QUESTION 1
Country with the highest consumption of beer

--ANSWER--

select "BRANDS", "COUNTRIES", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "BRANDS" not like '%malt%' 
group by "BRANDS", "COUNTRIES" 
order by "Total-quantity" desc;

QUESTION 2
Highest sales personnel of Budweiser in Senegal

---ANSWER---

select "SALES_REP", "BRANDS", "COUNTRIES", sum("QUANTITY") as "Total-quantity" 
from "confi-data"
where "BRANDS" like '%budweiser%' and "COUNTRIES" in ('Senegal')
group by "BRANDS", "COUNTRIES", "SALES_REP" 
order by "Total-quantity" desc;

QUESTION 3
Country with the highest profit of the fourth quarter in 2019

---ANSWER---

select "BRANDS", "MONTHS", "COUNTRIES", sum("PROFIT") as "Total-Profit" 
from "confi-data"
where "YEARS" = 2019 and "MONTHS" in ('October', 'November', 'December') 
group by "BRANDS", "COUNTRIES", "MONTHS" 
order by "Total-Profit" desc;

--- THANK YOU---