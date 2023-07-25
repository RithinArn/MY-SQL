# Q1
-- IN screen shot

# Q2
-- In screen shot

# Q3
USE ecommerce;
DESC users_data;

# Q4
SELECT * FROM users_data LIMIT 100;

# Q5
SELECT COUNT(DISTINCT country)dist_country,COUNT(DISTINCT language)dist_language FROM users_data;

# Q6
SELECT sum(socialNbFollowers),gender FROM users_data GROUP BY gender;

# Q7
-- (a)
SELECT COUNT(*) FROM users_data WHERE hasprofilepicture='True';

-- (b)
SELECT COUNT(*) FROM users_data WHERE hasanyapp='True';

-- (c)
SELECT COUNT(*) FROM users_data WHERE hasAndroidApp='True';

-- (d)
SELECT COUNT(*) FROM users_data WHERE hasIosApp='True'; 

# Q8
select country,COUNT(productsBought)from users_data group by country order by COUNT(productsBought)desc;

# Q9
SELECT country,count(productssold) FROM users_data group by country ORDER BY count(productssold) ASC;

# Q10
SELECT language,COUNT(*) FROM users_data GROUP BY language;

# Q11
SELECT country,count(productsbought) FROM users_data GROUP BY country ORDER BY count(productsbought)DESC;

# Q12
SELECT * FROM users_data ORDER BY dayssincelastlogin ASC LIMIT 110;

# Q13
SELECT COUNT(gender) FROM users_data WHERE gender='F' AND dayssincelastlogin>=100;

# Q14
SELECT COUNT(gender),country FROM users_data WHERE gender='F' GROUP BY country;

# Q15
SELECT COUNT(gender),country FROM users_data WHERE gender='M' GROUP BY country;
