

/*----------------------------   Task 1:- Understanding the Data    -------------------*/                                                 /*  Name :- Aniket Rajendra Shoste */

/* 

____________________                _______________________              ______________________
| cust_dimen       |               |    market_fact        |             |    orders_dimen     |                           
|                  |               |                       |             |                     |
| Customer_Name    |               |     Ord_id            |             |     Order_id        |                  
| Province         |---------------|     Prod_id           |-------------|    Order_Date       |     
| Region           |               |     Ship_id           |             |    Order_priority   |      
| Customer_Segment |           ----|     Cust_id           |-----        |     Ord_id          |                             
| Cust_id          |          |    |     Sales             |    |        |_____________________|
|__________________|          |    |    Discount           |    |
					          |    |    Order_Quantity     |    |          
 _________________________    |	   |    Profit             |    |         ______________________
 |	prod_dimen			 | 	  |	   |   Shipping_Cost       |    |         |   shipping_dimen   |
 |	                	 |	  |    |  Product_Base_Margin  |    |         |                    |
 |	Product_Category     |----     |_______________________|    ----------|    Order_ID        |  
 |	Product_Sub_Category |                                                |    Ship_Mode       |
 |  Prod_id              |                                                |    Ship_Date       | 
 |_______________________|                                                |    Ship_id         |  
                                                                          |____________________| 
1. Describe the data in hand in your own words. 

The " superstorers "  database  contains of  five tables they are as fallows :-

    1. cust_dimen: It contains details of all the customers with their respective fields  this table consist of following columns :- 
		
		   Customer_Name :      Which tells the Name of the customer 
                Province :      Province of the customer
                  Region :      Which Region does  the customer belong
        Customer_Segment :      Tells about the segment of the customer
				 Cust_id :      It is the Unique / distinct Customers ID 
	
    2. market_fact: Details of every order item sold
		
             Ord_id :       Tells the Order ID 
            Prod_id :       Tells the  Prod ID
            Ship_id :       Tells the  Shipment ID
            Cust_id :       Tells the  Customer ID
              Sales :       It gives us the Sales from the item sold
	       Discount :       Tells the Discount given on the item sold
     Order_Quantity :       Gives the Order Quantity of the Item sold
			 Profit :       Tells the Profit from the item which are sold
	  Shipping_Cost :       Gives the  Shipping Cost of the item sold
Product_Base_Margin :       Show the Product Base Margin on the item sold
        
    3. orders_dimen:  gives us the details about  every order placed
		
          Order_ID :    It is the Order ID
        Order_Date :    It gives us the  Order Date with repect to Order_ID
			Ord_id :    It is the Unique / distinct Order ID
    Order_Priority :    Says about the Priority of the Order as 'High' , 'Low'
	
    4. prod_dimen: Tells about the details about product category and sub category
		
            Product_Category :     Tells us about the Product Category as 'Office supplies'   'Technology'  'Furniture'
                     Prod_id :     It is the Unique / distinct  Product ID
        Product_Sub_Category :     Tells about the  Product Sub Category
	
    5. shipping_dimen: Details of shipping of orders
		
         Order_ID :    Tell us the Order ID
        Ship_Mode :    It tells us the various Shipping Mode 
        Ship_Date :    It tells the  Shipping Date
          Ship_id :    It is the Unique / distinct Shipment ID
        
        
2. Identify and list the Primary Keys and Foreign Keys for this dataset provided to 
you(In case you don’t find either primary or foreign key, then specially mention 
this in your answer)


	(Hint: If a table don’t have Primary Key or Foreign Key, then specifically mention it in your answer.)
	
    1. cust_dimen
		Primary Key: Cust_id
        Foreign Key: Not Available 
	
    2. market_fact
		Primary Key: Not Available 
        Foreign Key: Ord_id, Prod_id, Ship_id, Cust_id
	
    3. orders_dimen
		Primary Key: Ord_id
        Foreign Key: Not Available 
	
    4. prod_dimen
		Primary Key: Prod_id, Product_Sub_Category
        Foreign Key: Not Available 
	
    5. shipping_dimen
		Primary Key: Ship_id
        Foreign Key: Not Available 
 */
 








/*------------------------------------    Task 2:- Basic & Advanced Analysis     ---------------------------------------------------- */

create database Superstores;


use superstores;
show tables;
select * from cust_dimen;
select * from prod_dimen;
select * from orders_dimen;
select * from market_fact;
select * from shipping_dimen;

--  1 . Write a query to display the Customer_Name and Customer Segment using alias  
--      name “Customer Name", "Customer Segment" from table Cust_dimen.

     select * from cust_dimen;

-- ans:-

		select customer_name as ' Customer Name ' , 
         customer_segment as 'Customer Segment '
		 from cust_dimen ;
          
-- 2. Write a query to find all the details of the customer from the table cust_dimen order by desc.

   select * from cust_dimen;

-- ans:-  
                          
                   select * 
                   from cust_dimen 
                   order by customer_name  desc ;

-- 3. Write a query to get the Order ID, Order date from table orders_dimen where ‘Order Priority’ is high.

   select * from orders_dimen;

-- ans:-  
                   
                   select order_id ,order_date  
                   from orders_dimen 
                   where order_priority like 'HIGH' ;
                   
                   
--  4. Find the total and the average sales (display total_sales and avg_sales)                   
  
   select * from market_fact;

-- ans:-                      
                     select round(sum(sales),2) as Total_sales , round(avg(sales),2) as avg_sales
                     from market_fact;
                     
                      
 --  5. Write a query to get the maximum and minimum sales from maket_fact table                   
  
   select * from market_fact;

-- ans:-              
					  select min(sales ) as MIN_sales , max(sales)  as MAX_sales      
                      from market_fact ;
                      
-- 6. Display the number of customers in each region in decreasing order of  no_of_customers. The result should contain columns Region, no_of_customers.                       
	
   select * from cust_dimen;

-- ans:- 	
                      select  region , count(customer_name) as no_of_customers
                      from cust_dimen
                      group by region 
                      order by no_of_customers desc;
                      
                      

-- 7. Find the region having maximum customers (display the region name and  max(no_of_customers)
	
   select * from cust_dimen;

-- ans:- 	                
                      select  region , count(customer_name) as MAX_no_of_customers
                      from cust_dimen
                      group by region 
                      order by MAX_no_of_customers desc limit 1 ;
                      
                      
                            
-- 8.   Find all the customers from Atlantic region who have ever purchased ‘TABLES’ 
--      and the number of tables purchased (display the customer name, no_of_tables purchased) 
	
    select * from cust_dimen; 
    select * from prod_dimen;
	select * from market_fact;

-- ans:- 	       
                   
                   select c.Customer_name, count(m.Prod_id) as Number_of_tables_purchased 
                   from cust_dimen c  
                    left join
                   market_fact m
                        on m.Cust_id = c.Cust_id 
                    left join
                   prod_dimen p 
                        on p.Prod_id = m.Prod_id 
                   where c.Region = 'ATLANTIC' and p.Product_Sub_Category = 'TABlES'
                   group by c.Customer_name;    
                   
                   
 --  9. Find all the customers from Ontario province who own Small Business. (display the customer name, no of small business owners)
         
                 select * from cust_dimen;     
         
  -- ans:-            
             
             
             select  c.customer_name , province , count(c.customer_segment) as no_of_small_business_owners
             from cust_dimen as c
             where province = 'ontario' and c.customer_segment =  'small business'
             group by c.Customer_name ; 
             
			
            
 --  10. Find the number and id of products sold in decreasing order of products sold (display product id, no_of_products sold)            
				
			select * from market_fact; 
            
  -- ans:- 
                         select  prod_id , sum(order_quantity) as no_of_products_sold
                         from   market_fact 
                         group by prod_id  
                         order by no_of_products_sold desc ; 
						
--   11. Display product Id and product sub category whose produt category belongs to Furniture and Technlogy. 
--       The result should contain columns product id, product sub category.
                     
			select * from prod_dimen;
  
  -- ans:- 
                 
            select prod_id , product_category
            from prod_dimen
            where product_category = 'furniture' or product_category = 'technology' ;
            
            
--    12. Display the product categories in descending order of profits (display the product category wise profits i.e. product_category, profits)?            
            
            select * from prod_dimen;
            select * from market_fact; 
      
  -- ans:-       
					 select pd.product_category , round(sum(m.profit)) as profit 
                      from 
                      prod_dimen as pd
                      inner join
                      market_fact as m   on pd.prod_id = m.prod_id 
                      group by pd.Product_Category
                      order by  m.profit desc ;
                      

                        
                        
-- 13. Display the product category, product sub-category and the profit within each subcategory in three columns.  

            select * from prod_dimen;
            select * from market_fact; 
      
  -- ans:-       
					  select p.product_category , p.product_sub_category , round(sum(m.profit)) as profit
					  from 
                      market_fact as m
                      inner join
					  prod_dimen as p  on m.prod_id = p.prod_id 
                      group by p.product_sub_category 
                      order by p.product_sub_category ;
                      
	
  --   14. Display the order date, order quantity and the sales for the order.

             select * from orders_dimen;
             select * from market_fact;
  -- ans:-     
                             
						   select  od.Order_Date , m.Order_Quantity , m.Sales
                           from 
                           orders_dimen as od
                           inner join 
                           market_fact as m on od.ord_id  = m.ord_id ;
                           
                           
 --  15. Display the names of the customers whose name contains the 
 -- i) Second letter as ‘R’
 -- ii) Fourth letter as ‘D’                         
             
                 select * from cust_dimen;     
         
  -- ans:-  i) Second letter as ‘R’                          
                           
                     select Customer_name
                     from cust_dimen
                     where Customer_name like '_R%' ;     
    
  -- ans:-  ii) Fourth letter as ‘D’                         
                     
					 select Customer_name
                     from cust_dimen
                     where Customer_name like '___D%' ; 
   
   
-- 16. Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and  their region where sales are between 1000 and 5000.       
          
     select * from cust_dimen; 
	 select * from market_fact;
     
  -- ans:-            
                       select c.Cust_id , round(m.Sales) as Sales , c.Customer_Name , c.Region
                       from 
                       cust_dimen as c
                       inner join 
                       market_fact as m  on c.cust_id = m.cust_id 
                       where m.sales between 1000 and 5000 
                       group by c.Customer_name;
                       
  
  -- 17. Write a SQL query to find the 3rd highest sales.             
  
      select * from market_fact;
                       
                        select sales
                        from market_fact
                        order by sales desc  limit 2,1;
                        
                        
               
 /*                       
--    18. Where is the least profitable product subcategory shipped the most? For the least 
	      profitable product sub-category, display the region-wise no_of_shipments and the 
         profit made in each region in decreasing order of profits (i.e. region, no_of_shipments, profit_in_each_region)
         
         → Note: You can hardcode the name of the least profitable product subcategor                     
                                                                                                                     */
                  select distinct region from cust_dimen ;
                  
    -- ans:-                                                                                                                         
                                                                      
                                                                        
		select c.Region ,count(m.Ship_id) as "no_of_shipments", 
			   round(sum(m.Profit)) as "profit_in_each_region"
	from market_fact m 
		inner join 
        cust_dimen c on m.Cust_id = c.Cust_id
        inner join 
        prod_dimen p on m.Prod_id = p.Prod_id
			Where Product_Sub_Category = (
				     Select p.Product_Sub_Category 
				         from market_fact m 
					     inner join 
                         prod_dimen p on m.Prod_id = p.Prod_id
						 group by Product_Sub_Category
						 order by sum(m.Profit) LIMIT 1) 
        group by c.Region
        order by sum(m.Profit) desc ;   
						
                        
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------                       
                                    