--Does a businesses city, meaningfully affect its star rating?--

SELECT 
  city, 
  AVG(stars), 
  
--This is the formula for the chi_squared test
--It is important to note that SQL doesn't let you use SUM(AVG(stars)), so I used the COUNT(city) to 
--calulcuate this sum.

  (SUM(stars*stars)+COUNT(city)*AVG(stars)*AVG(stars)-2*SUM(stars)*AVG(stars))/(AVG(stars)) AS chi_squared, 
  COUNT(city) AS num_trials_per_city
FROM 
  business 
GROUP BY 
  city
HAVING 
  50<=num_trials_per_city 
  AND 
  num_trials_per_city<=201
ORDER BY 
  num_trials_per_city DESC;
                                                                                    
-- Output:                                                                                    
                                                                                    
-- +-----------------+---------------+---------------+---------------------+
-- | city            |    AVG(stars) |   chi_squared | num_trials_per_city |
-- +-----------------+---------------+---------------+---------------------+
-- | Cleveland       | 3.65873015873 | 46.5292841649 |                 189 |
-- | Gilbert         | 3.86170212766 | 54.7438016529 |                 188 |
-- | Glendale        | 3.54521276596 | 63.0048762191 |                 188 |
-- | Madison         | 3.68465909091 | 38.7413261372 |                 176 |
-- | Mississauga     | 3.42333333333 | 30.1952288218 |                 150 |
-- | Stuttgart       | 3.81205673759 | 24.2046511628 |                 141 |
-- | Peoria          | 3.78571428571 | 29.3018867925 |                 105 |
-- | Markham         |       3.28125 | 16.5857142857 |                  80 |
-- | Champaign       | 3.51408450704 | 20.4849699399 |                  71 |
-- | North Las Vegas | 3.41428571429 | 22.1087866109 |                  70 |
-- | North York      |     3.2421875 | 19.5843373494 |                  64 |
-- | Surprise        |         3.675 | 15.3503401361 |                  60 |
-- | Richmond Hill   | 3.15740740741 |  11.215542522 |                  54 |
-- +-----------------+---------------+---------------+---------------------+                                                                                   
                                                                                    
                                                                                    

  /*In order to determine whether the city can meaningfully affect a cities star rating,
	we will apply a Chi-Squared analysis of the data. This is a statistical test to det-
	ermine whether the stars associated with a city are random or if they are related to
	one another. The chi-squared value is given by 

	chi_squared=SUM(Observed_i-Expected_i)^2/Expected_i

	for each city. The expected value is just the average star rating for each city and
	the observed is each individual star rating for that city. 

	Each city will have an associatd degree of freedom to it. This is given by

	degree of freedom=COUNT(city)-1.

	These degrees of freedom are essentially how many different businesses are in a city.
	Given a signifcance level of 0.10, the degrees of freedom determine the critical val-
	ue for the chi_squared distribution. If the calculated chi_squared value is less than
	the critical value for the given city (hence given degrees of freedom), we say that 
	we are 90% confident that the city does not influence the star rating for a business.
	If it is greater than that critical value, we say that we are 90% confident that the 
	city does influence the star rating for a business.

	From here we choose values that have a number of ratings between 50 and 200. We pick
	greater than 50 because we need a larger sample size to justify the test and less than
	200 since most tables don't have calculated critical values for degrees of freedom
	(num_trials_per_city) greater than 200. 

	When we apply this chi_squared analysis, we find that every city is below the 
	corresponding critical value. This tells us that the given test is not statistically
	meaningful in answering the problem at hand! 

	As an example, the critical value given Richmond Hill is 66.548. This value is much 
	larger than the calculated chi_squared meaning we can't determine with any signifcance 
	through this test whether the city influences the star rating of the busineeses.*/
