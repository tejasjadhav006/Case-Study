/* 
Case study - Dmart_products
Name-Tejas Jadhav 

*/


use dmart_products;
SELECT * FROM dmart;

-- 1. Get the total count of products available in Dmart.
select count(*) from dmart;

-- 2. Find the products with a price greater than 190.
select * from dmart where price > 190;

-- 3. Get the average price of all products in Dmart.
select avg(Price) from dmart;

-- 4. Find the total products with a brand name starting with the letter "P".
select count(Brand) from dmart where Brand like "P%";

-- 5. Get the top 5 products with the highest prices.
select pro_name, price from dmart order by price desc limit 0,5;

-- 6. Get the total number of unique brands available in Dmart.
select count(distinct Brand) as brand from dmart;

-- 7. Which brands have products with an average price higher than Rs250?
select brand, avg(price) as price from dmart group by brand having avg(price) > 250;

-- 8. Find products with a brand name starting with the letter "P".
select * from dmart where Brand like "P%";

-- 9. Get all products with a discounted above 20%.
select * from dmart where Discountedprice > (price * 0.8);

-- 10. What are the top 5 most expensive products in terms of price?
select distinct pro_name,price from dmart order by price desc limit 0,5;

-- 11. find 2nd lowest avg price in the subcategory below 500.50.
select subcategory, count(*), avg(price) from dmart group by subcategory having avg(price) < 500.50 limit 1,1;

-- 12. What is the minimum quantity available for products in each subcategory?
select subcategory, min(subcategory), count(*) from dmart group by subcategory having count(*) >50;

-- 13. Retrieve the 20 products with the highest revenue generated.
select pro_name, price from dmart order by price desc limit 0,20;

-- 14. Display the discounted price for each product by subtracting the discount amount from the original price.
select Pro_Name, Price - DiscountedPrice as DiscountedPrice from dmart;

-- 15. Display the names and categories of products that have a quantity higher than twice the average quantity of all products.
select Pro_Name, category from dmart where Quantity > (2 * (select avg(Quantity) from dmart));

-- 16. Retrieve the names and discounted prices of products that have a discount percentage between 20% and 30%.
select Pro_Name, DiscountedPrice from dmart where (DiscountedPrice / Price) * 100 between 20 and 30;

-- 17. Find all products with a subcategory ending with 'ware'.
select * from dmart where SubCategory like '%ware';

-- 18. Display all products with a name containing the word 'oes'.
select * from dmart where pro_name like "%oes%";

-- 19. Find all products with a brand containing exactly three characters.
select * from dmart where pro_name like "___";


-- 20. Display the product names and their corresponding categories. If a product belongs to the "Grocery" category, label it as "Daily use", otherwise label it as "Other".
select Pro_Name,
case 
when Category = "Grocery" then "Daily use"
else "Other"
end as CategoryLabel
from dmart;

-- 21. Calculate the discounted price for each product. If the product has a discount, apply the discount; otherwise, display the original price.
select Pro_Name, Price, DiscountedPrice,
case
when DiscountedPrice is not null then DiscountedPrice
else Price
end as FinalPrice
from dmart;

-- 22. Retrieve the brand and quantity of products. If the quantity is less than 10, label it as "Low Stock"; otherwise, label it as "In Stock".

select Brand, Quantity,
case
when Brand in (select Brand from dmart group by Brand having count(distinct Brand) < 10) then "Low Stock"
else "In Stock"
end as StockCheck
from dmart;

-- 23. Calculate the sum of the discounted prices for a specific brand.
select Brand, sum(DiscountedPrice) as TotalDiscountedPrice from dmart where Brand = "Premia" group by Brand;

-- 24. Calculate the average price for each category, rounded to two decimal places.
select Category, round(avg(Price), 2) as AveragePrice from dmart group by Category;

-- 25. Calculate the square root of the price for each product.
select Pro_Name, Price, sqrt(Price) as SquareRootPrice from dmart;
