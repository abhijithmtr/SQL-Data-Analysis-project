drop table if exists zepto;

create table zepto(
    sku_id serial primary key,
    category varchar(120),
    name varchar(120) not null,
    mrp numeric(8,2),
    discountPercent numeric(8,2),
    availableQuantity integer,
    discountedSellingPrice numeric(8,2),
    weightInGms integer,
    outOfStock boolean,
    quantity integer
);
-- count of rows
select count(*) from zepto;

-- data
select  * from zepto
limit 5;

-- null values 
select * from zepto
Where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null

--



-- product name vs Number of units
Select name,count(sku_id) as "Number of units"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

                            -- DATA CLEANING
-- price = 0
Select * from zepto 
Where mrp=0 
or 
discountedSellingPrice=0 ;  

Delete from zepto  
where
mrp=0

-- convert paise to rupees 
Update zepto
set mrp = mrp/100.0,
discountedSellingPrice= discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto

                             -- INSIGHTS

-- Q1. top 10 best value products based on the discount percentage 

Select name,mrp, discountPercent, 
rank () over (order by discountPercent desc) as "RANK"
from zepto;
--OR 👇
select distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;

--Q2. What are the products with high MRP(more than 300) but Out of Stock

Select distinct name, mrp from zepto 
Where outOfStock= true and mrp>300
order by mrp desc 
;

-- Q3. Calculate Estimate Revenue for each Category

Select category,
SUM(discountedSellingPrice*availableQuantity) as Total_Revenue
from zepto
group by category
order by Total_Revenue;

-- Q4. find all products where mrp is greater than 500 and discount is less than 10% 

Select distinct name,mrp,discountPercent
from zepto
Where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 category offering the highest avg discount percentage 

Select distinct category,
round(avg(discountPercent),2) as AVARAGE_DISCOUNT
from zepto
group by category
order by AVARAGE_DISCOUNT desc
limit 5;

--Q6 Find the price per gram for products above 100g and sort by value



--Q7. group the products into categoires like low, mid, bulk

Select 













