/*--------------------------------------------------  HR Database  -----------------------------------------*/                     /* Name :- Aniket Rajendra Shoste */

                     /*-----------  HR Database Exercises – by Board Infinity  -------------------*/

             use hr; 
             show tables;
		

--  1  Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"

  select * from employees ; 

 -- ans:- 
          select first_name  as 'First Name', last_name as 'Last Nameshipping_dimen'
          from employees;
           
--  2   Write a query to get unique department ID from employee table
 
 select * from employees ; 

 -- ans:-        
                   select distinct department_id 
                   from employees ;

-- 3  Write a query to get all employee details from the employee table order by first name, descending
  
   select * from employees ; 

 -- ans:-  
             select *
             from employees
		     order by first_name desc ;

-- 4   Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is  calculated as 15% of salary)

    select * from employees ;
    
-- ans:- 
			    select first_name , last_name , salary , 
                ( salary * 15/100 )  as PF
				from employees ;
                
-- 5   Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of  salary                

       select * from employees ;

-- ans:-   
                    select employee_id , concat(first_name,'  ', last_name) as Name , salary 
                     from employees
                     order by salary asc;
       -- or 
                            select employee_id , first_name, last_name , salary 
						    from employees
                            order by salary asc;


-- 6     Write a query to get the total salaries payable to employees

      select * from employees ;

-- ans:-   
                        select count(employee_id) as 'Total Employees',sum(salary) as 'Total salaries payable'
                         from employees ;
            

-- 7    Write a query to get the maximum and minimum salary from employees table

		select * from employees ;

-- ans:-   
                           select  min(salary)as 'MIN_Salary' , max(salary) as 'MAX_Salary'
						    from employees ;
                           

--  8    Write a query to get the average salary and number of employees in the employees table

          select * from employees ;

-- ans:-  

                        select count(employee_id) as 'Total_Employees' ,avg(salary) as 'Average_Salary'
                        from employees ;


-- 9   Write a query to get the number of employees working with the company

         select * from employees ;

-- ans:-  

               select count(employee_id) as 'Total_Employees' 
                        from employees ;
                        
-- 10   Write a query to get the number of jobs available in the employees table

     select * from employees ;

-- ans:-                 
                        select count(distinct job_id)  
                        from employees;
                        
 -- 11    Write a query get all first name from employees table in upper case

     select * from employees ;

-- ans:-                 
                       select upper(first_name)  as UPPER_case_First_Name
						    from employees;
                          
                      
-- 12     Write a query to get the first 3 characters of first name from employees table

     select * from employees ;

-- ans:-                 
          
							select left(first_name,3)  as First_3_Characters_from_First_Name
						    from employees;
                            

-- 13      Write a query to get first name from employees table after removing white spaces from both side

     select * from employees ;

-- ans:-    
                               
							select Trim(first_name)  as Removed_Spaces_from_First_Name
						    from employees;


-- 14      Write a query to get the length of the employee names (first_name, last_name) from employees table

     select * from employees ;

-- ans:-    
                            select first_name ,last_name , length(first_name)+length(last_name) as Length_of_Name
						    from employees;
           
   
-- 15    Write a query to check if the first_name fields of the employees table contains numbers

     select * from employees ;

-- ans:-
						    select first_name 
						    from employees
                            where first_name REGEXP '[0-10]'; 
                            
  -- 16    Write a query to display the name (first_name, last_name) and salary for all employees whose salary is  not in the range $10,000 through $15,000

     select * from employees ;

-- ans:-                          
						    select first_name ,last_name ,salary
						    from employees
                            where salary  not between 10000 and 15000;
   
   -- 17    Write a query to display the name (first_name, last_name) and department ID of all employees in  departments 30 or 100 in ascending order
     
        select * from employees ;

-- ans:- 
						    select first_name ,last_name , department_id
						    from employees
                            where department_id = 30 or department_id = 100
                            order by department_id asc;
                            
                 /* or*/           
                            select first_name ,last_name , department_id
						    from employees
                            where department_id In (30,100)
                            order by department_id asc;

-- 18     Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100
     
        select * from employees ;

-- ans:- 
                                  select  first_name, last_name ,salary
                                  from employees 
								  where salary not between 10000 and 15000 and department_id In (30,100) 
                                  order by department_id asc ;

-- 19     Write a query to display the name (first_name, last_name) and hire date for all employees who were  hired in 1987
      
      select * from employees ;

-- ans:-                                  
                                          select  first_name , last_name , hire_date
                                          from employees 
                                          where year(hire_date)   like '1987';


-- 20    Write a query to display the first_name of all employees who have both "b" and "c" in their first name
      
      select * from employees ;

-- ans:-  
                           select first_name ,last_name
                           from employees
                           where first_name like ( 'b%'  'c%' );


-- 21  Write a query to display the last name, job, and salary for all employees whose job is that of a  Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
      
       select * from employees ;
      select distinct(job_id) from employees ;

-- ans:-  

								select last_name, job_id ,salary  
                                from employees 
                                where job_id in  ('IT_PROG' , 'sh_clerk') AND salary  not in (4500, 10000, 15000 );
                               
			
-- 22   Write a query to display the last name of employees whose names have exactly 6 characters
 
           select * from employees ;
 
-- ans:-  
                                select last_name    
                                from employees
                                where last_name like '______';

-- 23  Write a query to display the last name of employees having 'e' as the third character
 
           select * from employees ;
 
-- ans:-  
                               select last_name    
                                from employees
                                where last_name like '__e%';


-- 24     Write a query to get the job_id and related employee's id
 
           select employee_id, job_id from employees ;
 
-- ans:-  
                   select distinct job_id  , group_concat(employee_id separator ' , ') as 'Employee_ID'
				   from employees 
                   group by job_id; 

-- 25 ---- Write a query to update the portion of the phone_number in the employees table, within the phone  number the substring '124' will be replaced by '999'
 
           select * from employees ;
 
-- ans:-                      
                            update employees
                            set phone_number = REPLACE(phone_number , '124', '999')
                            where phone_number like '%124%' ;
        


-- 26   Write a query to get the details of the employees where the length of the first name greater than or  equal to 8

               select * from employees ;

-- ans:- 
						   select  first_name , length(first_name) as Length
				           from employees 
                           where length(first_name) >= 8 ;


-- 27 ----   Write a query to append '@example.com' to email field

               select * from employees ;

-- ans:-                  
                       
						  update employees
                          set email = concat('email','@example.com');
                          
					
                                 
-- 28    Write a query to extract the last 4 character of phone numbers

             select * from employees ;

-- ans:- 
						    select phone_number , right(phone_number,4) 
                            from employees;
                            

-- 29--- Write a query to get the last word of the street address

             select * from locations ;

-- ans:- 
			select street_address , SUBSTRING_INDEX(TRIM(street_address), ' ', -1)
            from locations;
            

-- 30  Write a query to get the locations that have minimum street length

             select * from locations ;     
             select min(length(street_address)) from locations;

-- ans:- 

		 select street_address   , length(street_address) as Min_street_address 
         from locations   
         where length(street_address) <= ( select min(length(street_address)) from locations );
		

-- 31 --- Write a query to display the first word from those job titles which contains more than one words

             select * from jobs;
-- ans:-        
                      select  job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1) as  'first word_job titles'
                      from jobs;
                            
                      
 -- 32    Write a query to display the length of first name for employees where last name contain character 'c'  after 2nd position                      

             select * from employees;
   
   -- ans:-           

                              select first_name  , length(first_name) , last_name 
                              from employees
                              where  instr(last_name,'c') >2 ;
                              
							 
                              
                              

-- 33   Write a query that displays the first name and the length of the first name for all employees whose 
--      name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
--      employees' first names

                   select * from employees;

   -- ans:-   
                        select first_name  , length(first_name)
                        from employees 
                        where  first_name like 'A%'
                        or
                        first_name like  'J%' 
                        or 
                        first_name like 'M%' 
                        order by first_name asc; 
                         

-- 34   Write a query to display the first name and salary for all employees. Format the salary to be 10 
--      characters long, left-padded with the $ symbol. Label the column SALARY
            
            select * from employee;
   
      -- ans:-
                  select first_name,
                  lpad(salary, 10, '$') as  SALARY
                  from employees;

-- 35   Write a query to display the first eight characters of the employees' first names and indicates the 
--      amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
--      descending order of salary
  
                   select * from employees;
  
  -- ans:-
                             select left(first_name,8) as ' First eight characters ' ,
                            repeat ('$', FLOOR(salary/1000)) as 'SALARY($)', salary
                                 from employees
                                order by salary desc ;
							 



-- 36   Write a query to display the employees with their code, first name, last name and hire date who hired 
--      either on seventh day of any month or seventh month in any year

              select * from employees ;
 
 -- ans:-                
						select a.employee_id , a.first_name , a.last_name , a.hire_date, a.dy , a.mt
                         from (
						 select  employee_id , first_name ,last_name , hire_date, day(hire_date) as dy , month(hire_date) as mt
                         from employees ) as a 
                        where a.dy = 7 or a.mt = 7;                   
       
 
 
    










/*--------------------------------------------------------   NORTH WIND     ----------------------------------------------------------------*/
                                    
                                    /*------  Northwind Database Exercises  by Board Infinity  ---- */

           use northwind ;
		   show tables ;
           
--  1  Write a query to get Product name and quantity/unit
 
            select* 
			from products;
 
 -- ans:-
            
            select distinct productname , quantityperunit 
            from products ;
 
 --  2  Write a query to get current Product list (Product ID and name)

-- ans:-
	       select  Productid,
		   Productname 
           from products 
		   group by Productname 
           order by  Productid asc;
 
 --  3   Write a query to get discontinued Product list (Product ID and name)
 
  select* from products;
  
 -- ans:-  
           select  Productid,
		   Productname , Discontinued
           from products 
		   where discontinued = 1
           order by  Productid asc;
           
  --  4  Write a query to get most expense and least expensive Product list (name and unit price)         
 
 select * from products;
 
 -- ans:-
			select Productid , Productname , UnitPrice 
			from products 
			order by UnitPrice desc ;

 --  5   Write a query to get Product list (id, name, unit price) where current products cost less than $20

 select * from products;
 
 -- ans:-   
 
           select Productid , Productname, UnitPrice 
           from products
           where UnitPrice < 20
           order by unitprice desc ;
 
  -- 6    Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
  
  select * from products;
  
  -- ans:- 
            select Productid , Productname, UnitPrice
			from products
            where UnitPrice >=15  and  UnitPrice <=25 
            group by Productname 
            order by unitprice asc ;
         
  --   7    Write a query to get Product list (name, unit price) of above average price
  
  select* from products;
  
  -- ans:-    
                    select Productname , UnitPrice  
                    from products
					where UnitPrice   >   (    select
                                               avg(UnitPrice)
											   from products  )
                    group by Productname
					order by unitprice asc ;
  
--   8    Write a query to get Product list (name, unit price) of ten most expensive products
 
         select* from products;
         
-- ans:-   
				    select Productname as Most_10_Expensive_Products , UnitPrice 
                    from products  
                    group by Productname
				    order by  UnitPrice desc limit 10;
                    
--   9      Write a query to count current and discontinued products				
          
          select* from products;

-- ans:-              
					select count(Productname) as current_and_discontinued_products ,  Discontinued
					from products
					group by Discontinued ;
                    
                      
--   10     Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order		

	     select* from products;

-- ans:-             
                      select ProductName as ' Product Name ' ,  UnitsOnOrder as ' Units On Order ', UnitsInStock as 'Units In Stock'
                      from Products
                      where  UnitsInStock < UnitsOnOrder;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                  








