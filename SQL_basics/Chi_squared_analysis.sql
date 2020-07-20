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
